class Comment < ActiveRecord::Base
  # English
  # belongs_to : creates and association to another model, this model
  # must have a field that holds the foraign key in the format  '[parent_table]_id'
  # where parent_table is the name of that parent model and it must end with an
  # undersore(_) and id. Doing this rails will fallow the convetion filosofy and
  # will be able to find the children of this parent model.
  #
  # :polymorphic => true : This is what makes the polymorphics assciation prosible
  # it tell rails that instead of using a foreing key in the form '[parent_table]_id'
  # instead it will use 2 fields , why ? because now this model can has more than one
  # parent object, so in one field the name of the parent model will of a given context
  # will be save along with that parent's id, so you will have to search 2 fields to find
  # one specific comment. The fields are in the format '[alias]_type' and '[alias]_id' where
  # the alias in the one defined in the parent models with the :as => assignment.
  # In this example, the comments table will has the options to saves comment for article
  # or proyect and the corresponding fields will be filled with values as
  #
  #      | commentable_type |    commentable_id   |
  #      |     Article      |         1           |  <== Belongs to an article with the id of 1
  #      |     Article      |         1           |  <== Belongs to the same article as the one above
  #      |     Article      |         2           |  <== Belongs to a diferent article
  #      |     Proyect      |         1           |  <== Belongs to a proyets with an id of 1
  #
  # Español
  # belongs_to : crea una asociación de este modelo a otro, ese otro modelo
  # debe tener una columna con la clave foranea con la forma  '[table_madre]_id'
  # donde tabla madre es ese modelo y debe termina en raya baja (_) e id. Haciendo
  # esto rails aplica la filosofia de convención sobre configuración y sera capas
  #  de encontrar los registros hijos de cada record de este modelo.
  #
  # :polymorphic => true : esto es lo que hace la asociacion polimorfica posible
  # le dice a rails que en ves de usar una llave foranea de la forma '[parent_table]_id'
  # usde 2 campos, por que ? porque ahora este modelo puede pertenecer  a varios objetos
  # asi un campo guarda el nombre del objeto padre y otro el id dentro de un contexto dado
  # de esta maneraa ahora cuando buscas a quien pertence una de esto commentarios debes
  # pasar ambos valores. Los campos son de la forma '[alias]_type' y '[alias]_id' donde
  # donde el alias es definido en los modelos padre con la asignación :as => .
  # En este ejemplo, los comentarios se guardan en la table con las valores de los
  # padres de la siguiente forma segun pertenezcan a un proyecto o un articulo.
  #
  #      | commentable_type |    commentable_id   |
  #      |     Article      |         1           |  <== pertenece un articulo con id= 1
  #      |     Article      |         1           |  <== pertenece al mismo articulo que le de arriba
  #      |     Article      |         2           |  <== pertenece a otro articulo
  #      |     Proyect      |         1           |  <== pertence a un proyecto con id= 1
  #
  belongs_to :commentable, :polymorphic => true


  # English
  # acts_as_nested_set : extends this class, that is it adds new functions to it
  # in this case it allows us to manage elements that can be nested, that is have
  # self reference or in other words it lets a comment belong to a comment. Note that the
  # other association is not affected. This gem/plugin will let us call the decendant or
  # comments that belong to another with the new added function decendants. For this
  # functionality the Comment model must have three spacial columns that this gem plugin needs
  # :parent_id, :lft and :rgt.
  #
  # Español
  # acts_as_nested_set : extiende esta clase, es decir le añade mas funciones
  # en este caso facilta la manipulación de objetos anidados, lo osea permite manejar
  # auto referencia, es decir que un comentario pertenezca otro comentario.
  # self reference or in other words it lets a comment belong to a comment. Nota
  # que la otra asociacion no es afectada. Esta gema/plugin no dejara llamar a los
  # decendientes de cada objeto con la funcion decendants. Para lograr todo esto la
  # gema requiere que el modelo Comment tenga unas columnas espaciales :parent_id, :lft and :rgt.
  acts_as_nested_set

  
  attr_accessible :author, :content,:parent_id, :lft, :rgt
end
