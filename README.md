### Install Craft

Bash
```bash
bash <(curl -s https://raw.githubusercontent.com/estebancastro/craft-boilerplate-atom/main/init.sh)
```

Fish
```bash
bash (curl -fL https://raw.githubusercontent.com/estebancastro/craft-boilerplate-atom/main/init.sh | psub)
```

### Update .env

Update _ASSETS_URL_ on `.env`

### Install Alpine (optional)

```bash
ddev npm install alpinejs @alpinejs/persist
```

Add this to `/src/js/app.js`
```bash
// Alpine.js
import Alpine from 'alpinejs';
import persist from '@alpinejs/persist';

window.Alpine = Alpine;
Alpine.plugin(persist);
Alpine.start();
```
