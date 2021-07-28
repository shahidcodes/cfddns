<h1 align="center">Cloudflare Dynamic DNS Updater 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/shahidcodes" target="_blank">
    <img alt="Twitter: shahidcodes" src="https://img.shields.io/twitter/follow/shahidcodes.svg?style=social" />
  </a>
</p>

> A docker image that updates dynamic dns of cloudflare hosted domains

## Usage

```sh
docker run --env-file ./.env -d shahidcodes/cloudflare-ddns
```

## Gotchas

- The current ip is fetched using `ifconfig.me` from container.
- This image can update multiple sub domains. This is useful if you are running a home lab and have only one public ip
- It only works for single zone.

## Author

👤 **Shahid Kamal**

- Website: http://shahidkamal.ml
- Twitter: [@shahidcodes](https://twitter.com/shahidcodes)
- Github: [@shahidcodes](https://github.com/shahidcodes)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](issues).
