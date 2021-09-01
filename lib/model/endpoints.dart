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
      "data": null,
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
        "username": String,
        "carrot": int,
        "coin": int,
        "heart": int,
        "league": int,
        "rank": int,
        "join-date": String,
        "avatar": String,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/get-user",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        "username": String,
        "carrot": int,
        "coin": int,
        "heart": int,
        "league": int,
        "rank": int,
        "join-date": String,
        "avatar": String,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/refresh-token",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "refresh token",
    },
    "response.data": {
      "data": null,
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/heart",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        "heart": int,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/user-details",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        //todo some specific data
        //todo like how many words he learnde and ..
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
        "league": int,
        "position": int,
        //competitors is a list off all people in one league
        //this list must be sorted (1 to n)
        "competitors": List,
      },
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "",
    "methode": "",
    "body": null,
    "header": "",
  },
];
