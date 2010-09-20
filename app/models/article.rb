class Article < ActiveRecord::Base
  # English
  # has_many : creates and association to another model, that model
  # must have a field that holds the foraign key in the form  '[parent_table]_id'
  # where parent_table is the name of this parent model(Article in this case) and it must end with an
  # undersore(_) and id. Doing this rails will fallow the convetion filosofy and
  # will be able to find the children of this parent model.
  #
  # :as => commentable : in this case we are doing polymorphic associations
  # and we are using an alias for this model, that alias is commentable
  # when you read the Comment.rb you will find more details on the purpose
  # of doing this.
  #
  # Español
  # has_many : crea una asociación de este modelo a otro, ese otro modelo
  # debe tener una columna con la llave foranea con la forma  '[table_madre]_id'
  # donde tabla madre es este modelo(Article en este caso) y debe termina en
  # raya baja (_) e id. Haciendo esto rails aplica la filosofia de convención
  # sobre configuración y sera capas de encontrar los registros hijos de cada
  # record de este modelo.
  # 
  # :as => commentable : en este caso estamos haciendo una asociación polimorphic
  # asi que le ponemos a este modelo una alias, encontraras mas detalles del objetido
  # de esto en los comentarios del archivo Comment.rb.
  has_many :comments, :as => :commentable

  # English
  # attr_accessible: is a function that specifies what columns of the table
  # are accessible from loading params[:article]. If the form that you set to
  # create fill the params hash has a value not litest here that value wont be
  # saved to the data base.  If attr_accessible is not defined all attributes
  # of this model are available to the views(or an http client) and can be target of unwanted
  # manipulation which would allow an unauthorized visitor to, for example, assign comments to
  # an article they dont belong to, if they are kind, that will be all.
  #
  # Español
  # attr_accessible: es una funcion que especifica a que columnas de esta table
  # se tiene acceso a traves guardar desde los valores pasados por params[:article].
  # Si el formulatio que creas llena la lista de nombre valor de params con un
  # valor que no esta definido aqui, el valor no se guarda en la base de datos.
  # Si attr_accessible se esta definido , todos los atributos del la tabla estam
  # disponibles para ser manipulados desde las vistas( o programas cliente http)
  # y pueden ser objeto manipulacion no deseada, que permitiria, por ejemplo asignar
  #  comentarios un articulo que no corresponde y eso si es con buenas intesones.
  attr_accessible :title, :body

  validates :title, :presence => true, :uniqueness => true

end
