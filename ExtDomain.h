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
enum class BoolKind { Bottom, False, True, Top };

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

inline const char *name(BoolKind kind) {
  switch (kind) {
  case BoolKind::Bottom:
    return "bottom";
  case BoolKind::False:
    return "false";
  case BoolKind::True:
    return "true";
  case BoolKind::Top:
    return "top";
  }
  return "top";
}

struct ZeroState {
  Kind kind = Kind::Bottom;
  BoolKind boolKind = BoolKind::Bottom;

  ZeroState() = default;
  /* implicit */ ZeroState(Kind kind, BoolKind boolKind = BoolKind::Bottom)
      : kind(kind), boolKind(boolKind) {}

  static ZeroState bottom() { return ZeroState(); }
  static ZeroState top() { return ZeroState(Kind::Top, BoolKind::Top); }
  static ZeroState boolean(BoolKind kind) {
    return ZeroState(Kind::Bottom, kind);
  }

  bool isBottom() const {
    return kind == Kind::Bottom && boolKind == BoolKind::Bottom;
  }

  /// Least upper bound in the product of the integer and boolean lattices.
  static ZeroState join(const ZeroState &lhs, const ZeroState &rhs) {
    return ZeroState(joinInt(lhs.kind, rhs.kind),
                     joinBool(lhs.boolKind, rhs.boolKind));
  }

  bool operator==(const ZeroState &other) const {
    return kind == other.kind && boolKind == other.boolKind;
  }
  bool operator!=(const ZeroState &other) const { return !(*this == other); }

  void print(llvm::raw_ostream &os) const {
    os << name(kind) << "/" << name(boolKind);
  }

private:
  static Kind joinInt(Kind lhs, Kind rhs) {
    if (lhs == Kind::Bottom)
      return rhs;
    if (rhs == Kind::Bottom)
      return lhs;
    if (lhs == rhs)
      return lhs;
    if (lhs == Kind::Top || rhs == Kind::Top)
      return Kind::Top;

    if ((lhs == Kind::One && rhs == Kind::Pos) ||
        (lhs == Kind::Pos && rhs == Kind::One))
      return Kind::Pos;

    const bool lhsNonPos =
        lhs == Kind::Neg || lhs == Kind::Zero || lhs == Kind::NonPos;
    const bool rhsNonPos =
        rhs == Kind::Neg || rhs == Kind::Zero || rhs == Kind::NonPos;
    if (lhsNonPos && rhsNonPos)
      return Kind::NonPos;

    const bool lhsNonNeg = lhs == Kind::Zero || lhs == Kind::One ||
                           lhs == Kind::Pos || lhs == Kind::NonNeg;
    const bool rhsNonNeg = rhs == Kind::Zero || rhs == Kind::One ||
                           rhs == Kind::Pos || rhs == Kind::NonNeg;
    if (lhsNonNeg && rhsNonNeg)
      return Kind::NonNeg;

    return Kind::Top;
  }

  static BoolKind joinBool(BoolKind lhs, BoolKind rhs) {
    if (lhs == BoolKind::Bottom)
      return rhs;
    if (rhs == BoolKind::Bottom)
      return lhs;
    if (lhs == rhs)
      return lhs;
    return BoolKind::Top;
  }
};

inline llvm::raw_ostream &operator<<(llvm::raw_ostream &os,
                                     const ZeroState &state) {
  state.print(os);
  return os;
}

} // namespace ext

#endif
