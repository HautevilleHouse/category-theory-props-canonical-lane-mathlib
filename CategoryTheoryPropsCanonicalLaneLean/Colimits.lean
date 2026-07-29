import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure ColimitPackage where
  category : CategoryPackage
  diagram : FunctorPackage (CategoryPackage.smallCategory) category
  cocone : FunctorPackage (CategoryPackage.smallCategory) category
  universalProperty : Prop
  existence : Prop

structure ColimitEvidence where
  universalPropertyClosed : Prop
  existenceClosed : Prop

def ColimitClosed (C : ColimitPackage) : Prop :=
  C.universalProperty ∧ C.existence

theorem colimit_closed_from_evidence (C : ColimitPackage) (E : ColimitEvidence) : ColimitClosed C :=
  And.intro E.universalPropertyClosed E.existenceClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse