//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/item.dart';

class ItemRepository {

//final MyApiClient apiClient;

// ItemRepository({@required this.apiClient}) : assert(apiClient != null);
//
  List<Item> _items = [
    Item(name: 'X-Burger', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 11.50, category: 'Burguer', urlImage: 'assets/x_burguer.png'),
    Item(name: 'X-Tudo', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
       price: 18.50, category: 'Burguer',urlImage: 'assets/x_tudo.png'),
    Item(name: 'X-Salada', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
     price: 11.20, category: 'Burguer', urlImage: 'assets/x_salada.png'),
    Item(name: 'X-Bacon', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
       price: 14.80, category: 'Burguer', urlImage: 'assets/x_bacon.png'),
    Item(name: 'X-Hot Dog', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 15.80, category: 'Burguer', urlImage: 'assets/hot_dog.png'),
    Item(name: 'Carne', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.50, category:  'Pastel', urlImage: 'assets/pastel_carne.png'),
    Item(name: 'Frango', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.50, category: 'Pastel', urlImage: 'assets/pastel_frango_c.png'),
    Item(name: 'Carne e Frango', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 5.50, category: 'Pastel', urlImage: 'assets/pastel_pizza.png'),
    Item(name: 'Frango e Catupiry', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 5.50, category: 'Pastel', urlImage: 'assets/pastel_frango_c.png'),
    Item(name: 'Pizza', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 5.50, category: 'Pastel', urlImage: 'assets/pastel_pizza.png'),
    Item(name: '4 Queijos', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 23.60, category: 'Pizza', urlImage: 'assets/queijo.png'),
    Item(name: 'Calabresa', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 21.80, category: 'Pizza', urlImage: 'assets/calabresa.png'),
    Item(name: 'Da Casa', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 29.90, category: 'Pizza', urlImage: 'assets/da_casa.png'),
    Item(name: 'Do Chefe', description: ' asdasds ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 32.80, category: 'Pizza', urlImage: 'assets/do_chefe.png'),
    Item(name: 'Sub Zero', description: 'ashdg hja assdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.40, category: 'Beer', urlImage: 'assets/heineken.png'),
    Item(name: 'Polo Norte', description: 'ashdg hjasasdsadsadasefasfdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',  
      price: 2.40, category: 'Beer', urlImage: 'assets/antartica.png'),
    Item(name: 'Pagode', description: 'ashdg hjasasdsajkdshakdjhsbadkjhbasdkdg jyasgdjashdakdgasasdsad kdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 2.20, category: 'Beer', urlImage: 'assets/samba.png'),
    Item(name: 'Conta Comigo', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 2.60, category: 'Beer', urlImage: 'assets/conti.png'),
    Item(name: 'Coque', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 4.20, category: 'Soda', urlImage: 'assets/coke.png'),
    Item(name: 'Guarana', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.20, category: 'Soda', urlImage: 'assets/guarana.png'),
    Item(name: 'Lemon', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.20, category: 'Soda', urlImage: 'assets/lemon.png'),
    Item(name: 'Uva hhhm', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.20, category: 'Soda', urlImage: 'assets/uva.png'),
    Item(name: 'Chocolate - 1L', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 14.50, category: 'Ice Cream', urlImage: 'assets/chocolate_sorvete.png'),
    Item(name: 'Creme - 1L', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 14.50, category: 'Ice Cream', urlImage: 'assets/creme.png'),
    Item(name: 'Morango - 1L', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 14.50, category: 'Ice Cream', urlImage: 'assets/morango.png'),
    Item(name: 'Manga - 1l', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 1.00, category: 'Ice Cream', urlImage: 'assets/manga.png'),
  ];

  getAll(){
    return _items;
  }
  // getId(id){
  //   return apiClient.getId(id);
  // }
  // delete(id){
  //   return apiClient.delete(id);
  // }
  // edit(obj){
  //   return apiClient.edit( obj );
  // }
  // add(obj){
  //     return apiClient.add( obj );
  // }

}