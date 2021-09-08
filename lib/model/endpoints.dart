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
      "status": String,
      "Message": String,
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
      "status": String,
      "Message": String,
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/get-user-info",
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
      "status": String,
      "Message": String,
      "access-token": String,
      "refresh-token": String,
    }
  },
  {
    "url": "/token/refresh",
    "methode": "POST",
    "body": {
      "refresh": String,
    },
    "header": null,
    "response.data": {
      "data": null,
      "status": String,
      "Message": String,
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
      "status": String,
      "Message": String,
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
      "status": String,
      "Message": String,
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
        // every competitor is in fact a user and i need some info
        // about him in form of a list of json
        // [
        //   {
        //     "avatar": String,
        //     "username" : String,
        //     "carrot" : int ,
        //   },
        //   {
        //     "avatar": String,
        //     "username" : String,
        //     "carrot" : int ,
        //   },
        // ],
        "competitors": List,
      },
      "status": String,
      "Message": String,
    }
  },
  {
    "url": "/get-competitor-info",
    //this api is for seeing other
    //people account info
    "methode": "POST",
    "body": {
      "username": String,
    },
    "header": null,
    "response.data": {
      "data": {
        "username": String,
        "carrot": int,
        "coin": int,
        "league": int,
        "rank": int,
        "join-date": String,
        "avatar": String,
        //todo add more info
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
      "data": {
        "words": List, // a list of words
        "translation": List // a list of words translations
      },
      "status": String,
      "Message": String,
    }
  },
  {
    "url": "/achievements",
    "methode": "GET",
    "body": null,
    "header": {
      "Authorization": "access token",
    },
    "response.data": {
      "data": {
        "achievements": List, // a list of achievements
      },
      "status": String,
      "Message": String,
    }
  },
  {
    "url": "",
    "methode": "",
    "body": null,
    "header": "",
  },
];
