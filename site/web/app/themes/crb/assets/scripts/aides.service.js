export class AidesService {
  constructor () {
    'ngInject';

    this.data = [
      {
        'id': 65,
        'title': 'Domexpo Moisselles/Baillet-en-France',
        'adresse': 'Rue des rouges gorges<br />95560 BAILLET-EN-FRANCE',
        'dep' : '95',
        'lat': '49.052059',
        'long': '2.331934'
      },
      {
        'id': 69,
        'title': 'Domexpo Mareuil-les-Meaux',
        'adresse': '2 mail Briards<br />77100 MAREUIL LES MEAUX',
        'dep' : '77',
        'lat': '48.939472',
        'long': '2.877903'
      },
      {
        'id': 68,
        'title': 'Domexpo Coignières',
        'adresse': '1 rue Marais<br />78310 COIGNI&Egrave;RES',
        'dep' : '78',
        'lat': '48.739704',
        'long': '1.911514'
      },
      {
        'id': 66,
        'title': 'Domexpo Ville-du-Bois',
        'adresse': 'Rue Croix St Jacques<br />91620 LA VILLE DU BOIS<br />',
        'dep' : '91',
        'lat': '48.669922',
        'long': '2.277228'
      }
    ];
  }

  getAides() {
    return this.data;
  }
}
