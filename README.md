# Modéa

<p align="center"><img src="docs/banner.png" alt="Modéa: fashion e-commerce app built with Flutter" width="100%"></p>

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS-0A2540)
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

A Flutter fashion e-commerce app: onboarding, product catalog, product pages, favorites and cart.

## Screens

<p align="center"><img src="docs/tour.gif" width="260" alt="Tour of the app: onboarding, home, product, favorites, cart, profile"></p>

| Onboarding | Home | Product |
|:---:|:---:|:---:|
| <img src="docs/screens/onboarding.png" width="160" alt="Onboarding screen"> | <img src="docs/screens/home.png" width="160" alt="Home screen"> | <img src="docs/screens/product.png" width="160" alt="Product screen"> |

| Favorites | Cart | Profile |
|:---:|:---:|:---:|
| <img src="docs/screens/favorites.png" width="160" alt="Favorites screen"> | <img src="docs/screens/cart.png" width="160" alt="Cart screen"> | <img src="docs/screens/profile.png" width="160" alt="Profile screen"> |

## Features

- **Onboarding**: introduction slides on first launch.
- **Sign in and sign up**: forms with social sign-in buttons.
- **Catalog**: search, category filters, promotional banner and top-selling products.
- **Product page**: rating, description, usage and reviews tabs, size selection, add to cart.
- **Cart**: quantities, promo code, order summary and checkout, with a payment confirmation screen.
- **Favorites**: products saved for later.
- **Profile**: orders, shipping addresses, payment methods and notification settings.

## Tech stack

- Flutter, Dart
- [google_nav_bar](https://pub.dev/packages/google_nav_bar), [onboarding](https://pub.dev/packages/onboarding), [flutter_svg](https://pub.dev/packages/flutter_svg), [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

```
lib/
├── constants/    colors, text styles
├── data/         product catalog
├── navigation/   bottom navigation
├── screens/      start, auth, home, shop, product_detail, favorite, profile
└── ui/           reusable widgets
```

## Getting started

```bash
flutter pub get
flutter run
```

## Status and roadmap

The catalog is local (`lib/data/products.dart`). Next steps:

- [ ] REST API for products, accounts and orders
- [ ] Real payment integration
- [ ] Order tracking

## License

MIT, see [LICENSE](LICENSE).

## Author

**Dissang Kevin** · Mobile AI Engineer
[Portfolio](https://dissangkevin.work) · [GitHub](https://github.com/kteken10)
