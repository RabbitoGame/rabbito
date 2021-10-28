const List<Map> endpoints = [
  {
    "url": "/register",
    "methode": "POST",
    "body": {
      "username": String,
      "password": String,
      "email": String,
    },
    "header": null,
    "response.data": {
      "data": {
        "id": int,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/login",
    "methode": "POST",
    "body": {
      "username": String,
      "password": String,
    },
    "header": null,
    "response.data": {
      "data": {
        "id": int,
        "carrot": int,
        "coin": int,
        "heart": int,
        "xp": int,
        "xpLevel": int,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/gamers/user-details/",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        "username": String,
        "join-date": String,
        "avatar": String, //or int? idk
        "xp": int,
        "xpLevel": int,
        "league": int, //this is for league, for example bronze1, gold3 , ...
        "rank-position": int, //position of user in that particular league
        //next three are given by the end of every card game
        "win": int,
        "loose": int,
        "correct-match": int,
        "total-number-words-learned": int,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/token/refresh/",
    "methode": "POST",
    "body": {
      "refresh": String,
    },
    "header": null,
    "response.data": {
      "data": {
        "id": int,
        "carrot": int,
        "coin": int,
        "heart": int,
        "xp": int,
        "xpLevel": int,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/rank",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        "count": int, // number of users in this league
        "league": int, //data for identifying league
        "position-in-league": int, //position of current player in league
        //competitors is a list off all people in one league
        //this list must be sorted (1 to n)
        // every competitor is in fact a user and i need some info
        // about him in form of a list of json

        "competitors": [
          {
            "avatar": String,
            "username": String,
            "carrot": int,
            "xpLevel": int,
          },
          {
            "avatar": String,
            "username": String,
            "carrot": int,
            "xpLevel": int,
          },
        ],
      },
      "status": String,
      "Message": String,
    }
  },
  {
    "url": "/words",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "league": int,
      //this is for current league, for example bronze1, gold3 , ...
      // must provide every word with it's corresponding league
      "learned_words": [
        {
          "bronze3": [
            {
              "in_first_lang": "wefwefw",
              "in_second_lang": "صبثاصب",
            },
            {
              "in_first_lang": "wewfwfwefw",
              "in_second_lang": "صبصثبصثثاصب",
            },
          ],
          "bronze2": [
            {
              "in_first_lang": "wefwefw",
              "in_second_lang": "صبثاصب",
            },
            {
              "in_first_lang": "wewfwfwefw",
              "in_second_lang": "صبصثبصثثاصب",
            },
          ],
          "silver1": [
            {
              "in_first_lang": "wefwefw",
              "in_second_lang": "صبثاصب",
            },
            {
              "in_first_lang": "wewfwfwefw",
              "in_second_lang": "صبصثبصثثاصب",
            },
          ],
        }
      ]
    }
  },
  {
    //this is for timer increase or decrease of hearts of a player
    "url": "/heart",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "heart": int,
    }
  },
  {
    "url": "/gamers/transactions/",
    "methode": "POST",
    "body": {
      "transaction_type": String, //increase or decrease
      "model_type": String, //coin or heart
      "amount": int,
      "gamer": int, //user id
    },
    "header": {
      "Authorization": "access token",
    },
    "response.data": null
  },
];
