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
    // Item('X-Salada', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //  11.20, 'Burguer', 'assets/x_salada.png'),
    // Item('X-Bacon', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //    14.80, 'Burguer', 'assets/x_bacon.png'),
    // Item('X-Hot Dog', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   15.80, 'Burguer', 'assets/hot_dog.png'),
    // Item('Carne', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   3.50, 'Pastel', 'assets/pastel_carne.png'),
    Item(name: 'Frango', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.50, category: 'Pastel', urlImage: 'assets/pastel_frango_c.png'),
    Item(name: 'Carne e Frango', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 5.50, category: 'Pastel', urlImage: 'assets/pastel_pizza.png'),
    // Item('Frango e Catupiry', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   5.50, 'Pastel', 'assets/pastel_frango_c.png'),
    // Item('Pizza', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   5.50, 'Pastel', 'assets/pastel_pizza.png'),
    Item(name: '4 Queijos', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 23.60, category: 'Pizza', urlImage: 'assets/queijo.png'),
    Item(name: 'Calabresa', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 21.80, category: 'Pizza', urlImage: 'assets/calabresa.png'),
    // Item('Da Casa', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   29.90,'Pizza', 'assets/da_casa.png'),
    // Item('Do Chefe', ' asdasds ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   32.80,'Pizza', 'assets/do_chefe.png'),
    Item(name: 'Sub Zero', description: 'ashdg hja assdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.40, category: 'Beer', urlImage: 'assets/heineken.png'),
    Item(name: 'Polo Norte', description: 'ashdg hjasasdsadsadasefasfdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',  
      price: 2.40, category: 'Beer', urlImage: 'assets/antartica.png'),
    // Item('Pagode', 'ashdg hjasasdsajkdshakdjhsbadkjhbasdkdg jyasgdjashdakdgasasdsad kdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   2.20,'Beer', 'assets/samba.png'),
    // Item('Conta Comigo', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   2.60,'Beer', 'assets/conti.png'),
    // Item('Coque', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   4.20, 'Soda', 'assets/coke.png'),
    Item(name: 'Guarana', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.20, category: 'Soda', urlImage: 'assets/guarana.png'),
    Item(name: 'Lemon', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 3.20, category: 'Soda', urlImage: 'assets/lemon.png'),
    // Item('Uva hhhm', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   3.20, 'Soda', 'assets/uva.png'),
    Item(name: 'Chocolate - 1L', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 14.50, category: 'Ice Cream', urlImage: 'assets/chocolate_sorvete.png'),
    Item(name: 'Creme - 1L', description: 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      price: 14.50, category: 'Ice Cream', urlImage: 'assets/creme.png'),
    // Item('Morango - 1L', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   14.50,'Ice Cream', 'assets/morango.png'),
    // Item('Manga - 1l', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
    //   1.00,'Ice Cream', 'assets/manga.png'),
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