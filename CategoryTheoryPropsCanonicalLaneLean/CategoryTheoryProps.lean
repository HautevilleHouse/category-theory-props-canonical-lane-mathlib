import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure Category where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : (X : Obj) → Hom X X
  comp : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  idLeft : {X Y : Obj} (f : Hom X Y) → comp (id X) f = f
  idRight : {X Y : Obj} (f : Hom X Y) → comp f (id Y) = f
  assoc : {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z) → comp (comp f g) h = comp f (comp g h)

structure Functor (C D : Category) where
  obj : C.Obj → D.Obj
  map : {X Y : C.Obj} → C.Hom X Y → D.Hom (obj X) (obj Y)
  mapId : (X : C.Obj) → map (C.id X) = D.id (obj X)
  mapComp : {X Y Z : C.Obj} (f : C.Hom X Y) (g : C.Hom Y Z) → map (C.comp f g) = D.comp (map f) (map g)

structure NaturalTransformation {C D : Category} (F G : Functor C D) where
  components : (X : C.Obj) → D.Hom (F.obj X) (G.obj X)
  naturality : {X Y : C.Obj} (f : C.Hom X Y) → D.comp (components X) (G.map f) = D.comp (F.map f) (components Y)

structure AdmittedObject where
  source : Category
  target : Category
  functor : Functor source target
  property : Prop
  conclusion : property

def WitnessClosed (O : AdmittedObject) : Prop :=
  O.property

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse