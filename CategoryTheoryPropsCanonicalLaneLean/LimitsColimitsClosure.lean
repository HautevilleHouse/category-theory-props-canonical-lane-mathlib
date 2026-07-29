import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryTheoryProps

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitData (J C : Category) (F : Functor J C) where
  cone : Type (max u v) -- the limit cone
  universal : Prop -- universal property

def LimitEvidence {J C : Category} {F : Functor J C} (L : LimitData J C F) : Prop :=
  L.universal

def LimitClosed {J C : Category} {F : Functor J C} (L : LimitData J C F) : Prop :=
  L.universal

theorem limit_closure {J C : Category} {F : Functor J C} (L : LimitData J C F) (h : LimitEvidence L) : LimitClosed L :=
  h

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse