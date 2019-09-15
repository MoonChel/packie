import 'package:packie/components/_all.dart';

import './models.dart';

const tips = [
  PackingTip(
    title: "Make a packing list",
    description:
        "Passport? Check. Toothbrush? Check. Sunscreen? Doh! For peace of mind that you’ve got the essentials covered.",
  ),
  PackingTip(
    title: "Avoid stains",
    description:
        "Ever packed light clothes and found a stain on them when you arrived? Never have this problem again. Firstly you should always make sure your light coloured clothes are packed inside out, and secondly, hold on to hotel disposable shower caps and use them to cover the base of your shoes.",
  ),
  PackingTip(
    title: "Roll and vacuum pack",
    description:
        "Don’t arrive at your holiday destination and be faced with a pile of ironing. To save space and stop creasing, roll your clothes instead of folding them, then place them in vacuum compression bags. To use these bags, put your clothes in, seal the bag, then squeeze the air out. This will leave you with lots more space in your suitcase and will prevent creases.",
  ),
  PackingTip(
    title: "Cube your clothes",
    description:
        "Another good packing solution is packing cubes – these help separate your items and find things more quickly once you get there.",
  ),
  PackingTip(
    title: "Fill dead space",
    description:
        "When it comes to packing, make use of every little inch of suitcase space that you can. Roll tops, underwear, socks, and other small items and stuff them into your shoes to make sure every possible space is filled.",
  ),
  PackingTip(
    title: "Stay fresh",
    description:
        "It’s important to keep your clothes smelling fresh, especially if you’re on a long trip. By taking a small bag of potpourri, fabric conditioner sheets, or scented drawer liners, you’ll keep your clothes smelling sweet throughout the trip.",
  ),
];

var clothesCategory = CheckListCategory(
  name: "CLOTHES_ACCESSORIES",
  iconPath: 'assets/images/clothes.png',
  items: [
    "Underwear",
    "Socks / Stockings",
    "Undershirts / bras",
    "Sleepwear",
    "T-shirts",
    "Dress / Casual shirts",
    "Jeans / Pants",
    "Dresses / Shorts / Skirts",
    "Sweaters / sweatshirts",
    "Formal wear (where appropriate)",
    "Swimsuits / cover-ups",
    "Coats / jackets / rainwear",
  ].map((name) => CheckListItem(name: name)).toList(),
);

var toiletriesCategory = CheckListCategory(
  name: "TOILETRIES",
  iconPath: 'assets/images/Group 12.png',
  items: [
    "Face cleanser",
    "Hairstyling tools",
    "Brush / comb",
    "Shampoo / conditioner",
    "Deodorant",
    "Soap",
    "Dental floss",
    "Toothpaste / Toothbrush",
    "Birth control",
    "Feminine-hygiene products",
    "Makeup + Makeup remover",
    "Shaving supplies",
    "Contact lenses / solution",
    "Moisturizer",
    "Sunscreen",
    "Face lotion/gel/etc.",
  ].map((name) => CheckListItem(name: name)).toList(),
);

var miscCategory = CheckListCategory(
  name: "MISC",
  iconPath: 'assets/images/camera.png',
  items: [
    "Cell phone",
    "Electronic chargers",
    "Laptop / tablet",
    "Plug adaptor",
    "Binoculars",
    "Emergency contacts",
    "Credit-card / bank contacts",
    "Copies of passport / creditcard / etc.",
  ].map((name) => CheckListItem(name: name)).toList(),
);

var carryOnCategory = CheckListCategory(
  name: "CARRY_ON",
  iconPath: 'assets/images/headphones.png',
  items: [
    "Lip balm",
    "Ear plugs / eye mask",
    "Pashmina / travel blanket",
    "Video / music player",
    "Earbuds / headphones",
    "Books or e-books",
    "Valuables, such as jewelry",
    "Passport / visa / ID",
    "Empty water bottle (fill post-security)",
    "Camera w / memory card",
    "Paper / pen",
    "Maps / directions",
    "Address book",
    "Insurance cards (medical / travel)",
    "Guidebook",
    "House / car keys",
  ].map((name) => CheckListItem(name: name)).toList(),
);

final myCheckList = CheckList(
  name: 'test',
  categories: [
    clothesCategory,
    toiletriesCategory,
    miscCategory,
    carryOnCategory,
  ],
);
