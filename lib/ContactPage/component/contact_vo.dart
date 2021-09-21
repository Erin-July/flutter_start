class ContactVO {
  //字母排列值
  String seationKey;

  String name;

  //头像
  String avatarUrl;

  ContactVO({required this.seationKey,required this.name,required this.avatarUrl});
}

List<ContactVO> contacts = [
  new ContactVO(
      seationKey: 'A',
      name: 'A张三',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201807/31/20180731152127_fctgj.jpg'),
  new ContactVO(
      seationKey: 'A',
      name: '张三2',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201408/25/20140825154927_MYtM4.jpeg'),
  new ContactVO(
      seationKey: 'A',
      name: '张三3',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201807/31/20180731152127_fctgj.jpg'),
  new ContactVO(
      seationKey: 'A',
      name: '张三4',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201408/25/20140825154927_MYtM4.jpeg'),
  new ContactVO(
      seationKey: 'A',
      name: '张三5',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201408/25/20140825154927_MYtM4.jpeg'),
  new ContactVO(
      seationKey: 'B',
      name: 'B张三',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201805/25/20180525175518_dbyte.jpg'),
  new ContactVO(
      seationKey: 'B',
      name: '张三',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201805/25/20180525175518_dbyte.jpg'),
  new ContactVO(
      seationKey: 'B',
      name: '张三',
      avatarUrl:
          'http://b-ssl.duitang.com/uploads/item/201805/25/20180525175518_dbyte.jpg')
];
