#  ENVOY Code Test

## Instructions

You will be creating an app that displays information pulled from the video game streaming service Twitch.tv.

Feel free to use whichever framework / library you deem necessary to complete this task. Make sure to pay attention to both performance and usability. Spend some extra time making sure your code is easily readable and understandable - add comments where necessary.

You will find a .png file (TestAppDesign.png) with the design for the proposed test app. Replicate that design in your test app as closely as possible.

When finished, please zip up this project and email it to back to who originally sent it to you, following the naming convention:  codetest_<your name>_<date>.
Note: Please refrain from placing this test on any public facing code repository (ex: Github / Bitbucket)

## API

You should be able to find all of the information you need in this document to communicate with the Twitch API.

- You can use the following client id when communicating with the API: nq033i1s4i5vgvu8q9pqot96ugl9dd
- You must include the client id as a header on each request with the key -> "Client-ID"
- Should you need any additional information it can be found here: https://dev.twitch.tv/docs/v5/reference/games
- You can use the following API URL to acquire this data: https://api.twitch.tv/kraken/games/top?limit=20

``` /* Example of the games/top/ JSON Response
{
    "_total": 1678,
    "_links": {
        "self": "https://api.twitch.tv/kraken/games/top?limit=10",
        "next": "https://api.twitch.tv/kraken/games/top?limit=10&offset=10"
    },
    "top": [
        {
            "game": {
                "name": "League of Legends",
                "popularity": 122107,
                "_id": 21779,
                "giantbomb_id": 24024,
                "box": {
                    "large": "https://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-272x380.jpg",
                    "medium": "https://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-136x190.jpg",
                    "small": "https://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-52x72.jpg",
                    "template": "https://static-cdn.jtvnw.net/ttv-boxart/League%20of%20Legends-{width}x{height}.jpg"
                },
                "logo": {
                    "large": "https://static-cdn.jtvnw.net/ttv-logoart/League%20of%20Legends-240x144.jpg",
                    "medium": "https://static-cdn.jtvnw.net/ttv-logoart/League%20of%20Legends-120x72.jpg",
                    "small": "https://static-cdn.jtvnw.net/ttv-logoart/League%20of%20Legends-60x36.jpg",
                    "template": "https://static-cdn.jtvnw.net/ttv-logoart/League%20of%20Legends-{width}x{height}.jpg"
                },
                "_links": {},
                "localized_name": "League of Legends",
                "locale": "en"
                },
            "viewers": 119456,
            "channels": 2238
        }
    ....... <--- Etc
    ]
}
*/
```

## Notes

- If you feel deviations are necessary / required please add the explanation to the 'addendums' section of this doc.
- If any concesions need to be made for something that couldn't be implemented for any reason please explain why in the 'addendums' section of this doc.
- Please make sure to limit your API request to 20 games at-a-time instead of making large requests.
- LaunchScreen.storyboard doesn't need to be modified and can be left blank.


## Addendums



