# Boom API integration

<details>
  <summary>Project setup</summary>

1. Clone the repo with `git clone https://github.com/sergiy17/boom_now_api.git`
2. To setup the BE part `cd boom_now_api && bundle && rails db:setup && rails s`
3. To start a FE part `cd boom_now_api && npm install && cd client && npm start`
4. Create `.env` file in the dir root. Place the `CLIENT_ID` and `CLIENT_SECRET` inside it.  
</details>

<details>
  <summary>Requests examples and screenshots</summary>

```
GET to http://127.0.0.1:3001/api/listings/search?city=Bradenton&adults=3
```
<img width="1175" alt="Image" src="https://github.com/user-attachments/assets/aad3a438-be7b-40f6-a62c-d42095e1d74b" />

Browser view 
<img width="1715" alt="Image" src="https://github.com/user-attachments/assets/be52e4de-786a-4c89-8717-92ae96b233a1" />

</details>

To access the React view part - http://localhost:3000/
