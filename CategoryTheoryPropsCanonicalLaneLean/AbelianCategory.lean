import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AbelianCategoryPackage where
  zeroObject : Type u
  biproducts : Prop
  kernels : Prop
  cokernels : Prop
  monicEpiImFactorisation : Prop
  abelianAxioms : Prop

structure AbelianCategoryEvidence (A : AbelianCategoryPackage) where
  zeroObjectClosed : A.zeroObject
  biproductsClosed : A.biproducts
  kernelsClosed : A.kernels
  cokernelsClosed : A.cokernels
  monicEpiImFactorisationClosed : A.monicEpiImFactorisation
  abelianAxiomsClosed : A.abelianAxioms

def AbelianCategoryClosed (A : AbelianCategoryPackage) : Prop :=
  A.zeroObject ∧ A.biproducts ∧ A.kernels ∧ A.cokernels ∧
  A.monicEpiImFactorisation ∧ A.abelianAxioms

theorem abelian_category_closed_from_evidence (A : AbelianCategoryPackage)
    (E : AbelianCategoryEvidence A) : AbelianCategoryClosed A := by
  exact And.intro E.zeroObjectClosed
    (And.intro E.biproductsClosed
      (And.intro E.kernelsClosed
        (And.intro E.cokernelsClosed
          (And.intro E.monicEpiImFactorisationClosed E.abelianAxiomsClosed))))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse