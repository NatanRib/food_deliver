//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/item.dart';

class ItemRepository {

//final MyApiClient apiClient;

// ItemRepository({@required this.apiClient}) : assert(apiClient != null);
//
  List<Item> _items = [
    Item('X-Burger', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      11.50, 'Burguer', 'assets/x_burguer.png'),
    Item('X-Tudo', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      18.50, 'Burguer', 'assets/x_tudo.png'),
    Item('X-Salada', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
     11.20, 'Burguer', 'assets/x_salada.png'),
    Item('X-Bacon', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
       14.80, 'Burguer', 'assets/x_bacon.png'),
    Item('X-Hot Dog', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      15.80, 'Burguer', 'assets/hot_dog.png'),
    Item('Carne', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.50, 'Pastel', 'assets/pastel_carne.png'),
    Item('Frango', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.50, 'Pastel', 'assets/pastel_frango_c.png'),
    Item('Carne e Frango', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      5.50, 'Pastel', 'assets/pastel_pizza.png'),
    Item('Frango e Catupiry', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      5.50, 'Pastel', 'assets/pastel_frango_c.png'),
    Item('Pizza', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      5.50, 'Pastel', 'assets/pastel_pizza.png'),
    Item('4 Queijos', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      23.60,'Pizza', 'assets/queijo.png'),
    Item('Calabresa', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      21.80,'Pizza', 'assets/calabresa.png'),
    Item('Da Casa', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      29.90,'Pizza', 'assets/da_casa.png'),
    Item('Do Chefe', ' asdasds ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      32.80,'Pizza', 'assets/do_chefe.png'),
    Item('Sub Zero', 'ashdg hja assdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.40,'Beer', 'assets/heineken.png'),
    Item('Polo Norte', 'ashdg hjasasdsadsadasefasfdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',  
    2.40,'Beer', 'assets/antartica.png'),
    Item('Pagode', 'ashdg hjasasdsajkdshakdjhsbadkjhbasdkdg jyasgdjashdakdgasasdsad kdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      2.20,'Beer', 'assets/samba.png'),
    Item('Conta Comigo', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      2.60,'Beer', 'assets/conti.png'),
    Item('Coque', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      4.20, 'Soda', 'assets/coke.png'),
    Item('Guarana', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.20, 'Soda', 'assets/guarana.png'),
    Item('Lemon', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.20, 'Soda', 'assets/lemon.png'),
    Item('Uva hhhm', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      3.20, 'Soda', 'assets/uva.png'),
    Item('Chocolate - 1L', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      14.50,'Ice Cream', 'assets/chocolate_sorvete.png'),
    Item('Creme - 1L', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      14.50,'Ice Cream', 'assets/creme.png'),
    Item('Morango - 1L', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      14.50,'Ice Cream', 'assets/morango.png'),
    Item('Manga - 1l', 'ashdg hjasdg jyasgdjashdakdgaskdg askdg ajsdb aksdb aksdhb asdjakjsdjh',
      1.00,'Ice Cream', 'assets/manga.png'),
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