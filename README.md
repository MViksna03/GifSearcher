# GifSearcher – Flutter App

GifSearcher ir vienkārša Flutter mobilā lietotne, kas ļauj lietotājam meklēt un apskatīt animētus GIF attēlus, izmantojot Giphy API. Lietotne atbalsta reāllaika meklēšanu, attēlu ielādi ar aizturi (`debounce`) un bezgalīgu skrollēšanu.

## Funkcionalitāte

- Meklēšana pēc atslēgvārda (reāllaikā)
- Automātiska papildināšana (infinite scroll)
- Attēlu ielāde no Giphy API
- Vienkāršs, adaptīvs Flutter interfeiss

## Instalēšana

### 1. Klonē repozitoriju

git clone https://github.com/MViksna03/GifSearcher.git
cd GifSearcher
### 2. Instalē atkarības
flutter pub get
### 3. Iestati savu Giphy API atslēgu
Izveido failu lib/config.dart ar saturu:

class Config {
  static const String apiKey = 'YOUR_GIPHY_API_KEY';
}
Vai kopē no piemēra:

cp lib/config.dart.example lib/config.dart
Nepieciešams iegūt savu Giphy API atslēgu.

### 4. Palaid aplikāciju
flutter run

### Failsistēmas struktūra

lib/
├── main.dart                 # UI un meklēšanas loģika
├── gif_search_service.dart  # API pieprasījumu apstrāde
├── config.dart.example      # API atslēgas piemērs
