import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitColimitPackage where
  diagramType : Type u
  limitObject : Type u
  colimitObject : Type u
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  existence : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit
  existenceClosed : L.existence

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit ∧ L.existence

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.universalPropertyLimitClosed
    (And.intro E.universalPropertyColimitClosed E.existenceClosed)

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse