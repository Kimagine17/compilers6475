//===- ExtDomain.h - The extended sign domain ---------------------------------===//
////                   top
//                    /   \
//                  0-     0+          0- = negative or zero
//                 /  \   /  \         0+ = positive or zero
//                -    0    +
//                 \   |    |
//                  \  |    1
//                   \ |  /
//                   bottom
// This is the file to replace first when building a different analysis.  MLIR's
// dataflow framework asks only three things of a lattice value:
//
//   * a default constructor, which must produce the bottom element, because the
//     solver starts every value optimistically and lowers it as facts arrive;
//   * a static join(), which must be commutative, associative, idempotent, and
//     monotone -- assertions in Lattice<> check monotonicity in debug builds;
//   * operator== and print().
//
//===----------------------------------------------------------------------===//

#ifndef EXT_DOMAIN_H
#define EXT_DOMAIN_H

#include "llvm/Support/raw_ostream.h"

namespace ext {

enum class Kind { Bottom, Neg, Zero, One, Pos, NonNeg, NonPos, Top };

inline const char *name(Kind kind) {
  switch (kind) {
  case Kind::Bottom:
    return "bottom";
  case Kind::Neg:
    return "neg";
  case Kind::Zero:
    return "zero";
  case Kind::One:
    return "one";
  case Kind::Pos:
    return "pos";
  case Kind::NonNeg:
    return "nonneg";
  case Kind::NonPos:
    return "nonpos";
  case Kind::Top:
    return "top";
  }
  return "top";
}

struct ZeroState {
  Kind kind = Kind::Bottom;

  ZeroState() = default;
  /* implicit */ ZeroState(Kind kind) : kind(kind) {}

  static ZeroState bottom() { return Kind::Bottom; }
  static ZeroState top() { return Kind::Top; }

  bool isBottom() const { return kind == Kind::Bottom; }

  /// Least upper bound in the extended sign lattice.
  static ZeroState join(const ZeroState &lhs, const ZeroState &rhs) {
    if (lhs.kind == Kind::Bottom)
      return rhs;
    if (rhs.kind == Kind::Bottom)
      return lhs;
    if (lhs.kind == rhs.kind)
      return lhs;
    if (lhs.kind == Kind::Top || rhs.kind == Kind::Top)
      return top();

    if ((lhs.kind == Kind::One && rhs.kind == Kind::Pos) ||
        (lhs.kind == Kind::Pos && rhs.kind == Kind::One))
      return Kind::Pos;

    const bool lhsNonPos = lhs.kind == Kind::Neg || lhs.kind == Kind::Zero ||
                           lhs.kind == Kind::NonPos;
    const bool rhsNonPos = rhs.kind == Kind::Neg || rhs.kind == Kind::Zero ||
                           rhs.kind == Kind::NonPos;
    if (lhsNonPos && rhsNonPos)
      return Kind::NonPos;

    const bool lhsNonNeg = lhs.kind == Kind::Zero || lhs.kind == Kind::One ||
                           lhs.kind == Kind::Pos || lhs.kind == Kind::NonNeg;
    const bool rhsNonNeg = rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
                           rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg;
    if (lhsNonNeg && rhsNonNeg)
      return Kind::NonNeg;

    return top();
  }

  bool operator==(const ZeroState &other) const { return kind == other.kind; }
  bool operator!=(const ZeroState &other) const { return kind != other.kind; }

  void print(llvm::raw_ostream &os) const { os << name(kind); }
};

inline llvm::raw_ostream &operator<<(llvm::raw_ostream &os,
                                     const ZeroState &state) {
  state.print(os);
  return os;
}

} // namespace ext

#endif
