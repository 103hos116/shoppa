class OnboardingContents {
  final String title;
  final String desc;
  final String image;

  OnboardingContents({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: 'Find the item you’ve\nbeen looking for',
    image: 'assets/1.png',
    desc:
        'Here you’ll see rich varieties of goods, carefully\nclassified for seamless browsing experience.',
  ),
  OnboardingContents(
    title: 'Get those shopping\nbags filled',
    desc:
        'Add any item you want to your cart, or save it on\nyour wishlist, so you don’t miss it in future',
    image: 'assets/1.png',
  ),
  OnboardingContents(
    title: 'Fast & secure\npayment',
    desc: 'There are many local payment options available\nfor your ease.',
    image: 'assets/1.png',
  ),
  OnboardingContents(
    title: 'Package tracking',
    desc:
        'In particular, Shoppa can pack your orders, and\nhelp you seamlessly manage your shipments.',
    image: 'assets/1.png',
  ),
  OnboardingContents(
    title: 'Nearby stores',
    desc:
        'Easily track nearby shops, browse\nthrough their items and get information\nabout their prodcuts.',
    image: 'assets/1.png',
  ),
];
