import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.Popups 1.0
import "components/backend.js" as Logic
import U1db 1.0 as U1db
//import QtMultimedia 5.0
//import "components/levels.js" as Lvl

import "components"

MainView {
    id:levels

    objectName: "mainView"
    applicationName: "palette.kevinfeyder"
    //useDeprecatedToolbar: false
    backgroundColor: "#ffffff"
    width: units.gu(45)
    height: units.gu(75)

    U1db.Database {
            id:colors;
            path: "palette.u1db"
        }

    U1db.Document {
          id: open
          database: colors
          docId: "color"
          create: true
          defaults:{"stages":[{"lvl":["#3fb8af","#8cc8ab","#dad8a7","#9f7a97","#c59a9c","#ecbba2","#ff3d7f","#ff6d8e","#ff9e9d"]},{"lvl":["#348aa7","#42627e","#513b56","#78b895","#6e8c73","#57877a","#bce784","#8cdd91","#5dd39e"]},
                              {"lvl":["#ff9b71","#956a6c","#2b3a67","#ffcc79","#c4866b","#89415e","#fffd82","#f3a26b","#e84855"]},
        ]}
    }
    U1db.Document {
          id: userSettings
          database: colors
          docId: "uSet"
          create: true
          defaults: { "nulvl": 0, "day": 0,"hint": 10,}
          contents: { "nulvl": 0, "day": 0,"hint": 10,}
        }

    U1db.Document {
          id: level00
          docId: "level01"
          create: true
          defaults:{"stages":[
          {"myArray":[0,4,2,1,7,5,6,3,8],"myColors":["#348aa7","#42627e","#513b56","#78b895","#6e8c73","#57877a","#bce784","#8cdd91","#5dd39e"],
                        "name":"Carribbean","size":3},
        ]}
          contents:{"stages":[
          {"myArray":[0,4,2,1,7,5,6,3,8],"myColors":["#348aa7","#42627e","#513b56","#78b895","#6e8c73","#57877a","#bce784","#8cdd91","#5dd39e"],
                        "name":"Carribbean","size":3},
          {"myArray":[0,3,2,4,1,7,6,5,8],"myColors":["#db504a","#804a45","#254441","#e37268","#b78166","#8c9165","#eb9486","#efb988","#f3de8a"],
                        "name":"Roses","size":3},
          {"myArray":[0,5,2,1,4,7,6,3,8],"myColors":["#10a5ba","#198090","#235b66","#87b876","#71a15f","#5b8a49","#ffcc33","#c9c32f","#93ba2c"],
                        "name":"Spring","size":3},
          {"myArray":[0,3,2,1,7,5,6,4,8],"myColors":["#ff5460","#a14d5b","#434657","#9f8b9a","#708e7b","#42915e","#3fc3d4","#40cf9c","#41dc65"],
                        "name":"Mixed Feelings","size":3},
          {"myArray":[0,1,2,3,7,4,6,5,8],"myColors":["#ff9b71","#956a6c","#2b3a67","#ffcc79","#c4866b","#89415e","#fffd82","#f3a26b","#e84855"],
                        "name":"Sunset","size":3},
          {"myArray":[0,5,2,1,7,4,6,3,8],"myColors":["#7ca982","#50735c","#243e36","#bcd076","#97a158","#73733a","#fdf86a","#dfd054","#c2a83e"],
                        "name":"Fresh Lemons","size":3},
          {"myArray":[0,7,2,1,3,4,6,5,8],"myColors":["#395e66","#2f8369","#26a96c","#1c7e5a","#489357","#74a855","#009e4f","#61a346","#c2a83e"],
                        "name":"Kale Anyone","size":3},
          {"myArray":[0,3,2,4,1,7,6,5,8],"myColors":["#634c5d","#7e4657","#994151","#b1612e","#be7338","#cc8642","#ff7700","#ffa119","#ffcc33"],
                        "name":"Autumn","size":3},
          {"myArray":[0,3,2,7,5,1,6,4,8],"myColors": ["#ffc53a","#f0994b","#e26d5c","#a37935","#c9905b","#f0a782","#472d30","#a3876c","#ffe1a8"],
                        "name": "soil","size":3},
          {"myArray":[0,4,2,3,1,7,6,5,8],"myColors": ["#ea526f","#923750","#3b1c32","#8876b0","#5b6f99","#2f6882","#279af1","#25a7e2","#23b5d3"],
                        "name": "Opposites","size":3},
          {"myArray":[0,7,2,1,3,4,6,5,8],"myColors": ["#261447","#8c5859","#f39c6b","#922655","#974a56","#9d6e57","#ff3864","#a33c54","#474044"],
                        "name": "Amber","size":3},
          {"myArray":[0,4,2,1,5,7,6,3,8],"myColors": ["#ead2ac","#c3c0b1","#9cafb7","#f4b29c","#b1a5a4","#6f98ad","#fe938c","#a08a98","#4281a4"],
                        "name": "Salty Fun","size":3},
          {"myArray":[0,5,2,4,1,7,6,3,8],"myColors": ["#028090","#096577","#114b5f","#7b6d7c","#7a888e","#7aa4a0","#f45b69","#ecaca5","#e4fde1"],
                        "name": "Americana","size":3},
          {"myArray":[0,4,2,1,7,5,6,3,8],"myColors": ["#f038ff","#ef54ce","#ef709d","#e993b7","#cc9ebe","#afaac6","#e2ef70","#a9e9af","#70e4ef"],
                        "name": "Bubblegum","size":3},
          {"myArray":[0,7,2,1,3,4,6,5,8],"myColors": ["#e0e0e0","#d1aaa7","#c3746e","#b3d7df","#99979a","#7f5855","#86cede","#61858d","#3c3c3c"],
                        "name": "Muted","size":3},
                        {"myArray":[0,7,2,1,3,4,6,5,8],"myColors": ["#8dd9d9","#b2e1ca","#d8e9bc","#72bfcc","#9accb3","#c3da9c","#57a5bf","#82b89d","#aecc7c"],
                                      "name": "Harmony","size":3},
                        {"myArray":[0,4,2,1,5,7,6,3,8],"myColors": ["#42c1f6","#9ea9b9","#fa927c","#92d9b3","#c6c486","#fbaf59","#e3f271","#efdf53","#fccc36"],
                                      "name": "JoyStar","size":3},
                        {"myArray":[0,5,2,4,1,7,6,3,8],"myColors": ["#00ffff","#7f99e5","#ff33cc","#7fff7f","#7f8c72","#7f1966","#ffff00","#7f7f00","#000000"],
                                      "name": "CMYK","size":3},
                        {"myArray":[0,4,2,1,7,5,6,3,8],"myColors": ["#ffe980","#9bc291","#389ca2","#80ab7a","#76b59d","#6cbfc0","#026d74","#51a8a9","#a1e3df"],
                                      "name": "Whales","size":3},
                        {"myArray":[0,7,2,1,3,4,6,5,8],"myColors": ["#fbf6b5","#e1b69a","#c7777f","#d8eabb","#b19e91","#8a5467","#b6dec1","#828788","#4e3150"],
                                      "name": "Gee Whiz","size":3},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#354242","#788160","#bbc07e","#ffff9d","#5c7a66","#849a66","#abba67","#d3da68","#84b28a","#90b36d","#9bb450","#a8b534","#acebae","#9ccd74","#8caf3a","#7d9100"],
                                      "name": "Herbal Tea","size":4},
                        {"myArray":[0,10,13,3,4,2,9,7,14,6,1,11,12,5,8,15],"myColors": ["#fb8b24","#d25d39","#aa2f4e","#820263","#a8943f","#a5634c","#a23258","#9f0264","#569d5b","#78695f","#9a3562","#bc0266","#04a777","#4b7072","#92396d","#d90368"],
                                      "name": "Manarola","size":4},
                        {"myArray":[0,14,13,3,10,7,6,5,11,9,4,8,12,1,2,15],"myColors": ["#477998","#847081","#c1676b","#fe5f55","#5c8d77","#928c74","#c88a72","#fe8a70","#72a157","#a0a868","#cfae7a","#feb58c","#88b637","#afc45c","#d7d282","#ffe1a8"],
                                      "name": "This is Kinda Nice","size":4},
                        {"myArray":[0,7,10,3,11,14,6,1,8,13,2,4,12,9,5,15],"myColors": ["#05668d","#037c90","#019293","#00a896","#048591","#1d9997","#36ad9d","#50c1a3","#03a495","#37b69e","#6bc8a7","#a0dab0","#02c39a","#51d3a5","#a0e3b1","#f0f3bd"],
                                      "name": "Moar Whales","size":4},
                        {"myArray":[0,1,13,3,6,10,4,9,8,7,5,14,12,2,11,15],"myColors": ["#fff684","#d2c367","#a6904b","#7a5e2f","#bfb565","#a6a464","#8f9363","#778263","#7f7547","#7b8561","#78967c","#74a797","#403529","#50675f","#619995","#72cccb"],
                                      "name": "Thanks for the Latte","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#ea526f","#e95a70","#e86272","#e76b74","#e3716f","#d46d6d","#c6696b","#b7656a","#dd906f","#c0806a","#a47064","#876060","#d7af70","#ac9367","#82775e","#585b56"],
                                      "name": "Raspberry Breve","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#e2df9a","#e5e180","#e8e366","#ebe54d","#bdbb7f","#bbb766","#b8b44e","#b5b137","#999764","#918e4d","#888536","#807d21","#757449","#676534","#59571f","#4b490b"],
                                      "name": "It's a Virtue","size":4},
                        {"myArray":[0,10,13,3,4,2,9,7,14,6,1,11,12,5,8,15],"myColors": ["#25020f","#6d072c","#b60c4a","#ff1168","#4d0b23","#7b1b3e","#aa2b59","#d93b75","#751437","#8a2f50","#9f4a68","#b46582","#9e1e4c","#994362","#946978","#8f8f8f"],
                                      "name": "Cherry Riot","size":4},
                        {"myArray":[0,10,13,3,4,2,9,7,14,6,1,11,12,5,8,15],"myColors": ["#1c4386","#675098","#b35daa","#ff6abd","#2248a4","#544d9c","#875295","#bb578f","#284dc2","#414aa1","#5c4780","#774561","#2e53e0","#2f48a6","#313d6c","#333333"],
                                      "name": "Stocking","size":4},
                        {"myArray":[0,10,13,3,4,2,9,7,14,6,1,11,12,5,8,15],"myColors": ["#fee63e","#f6df5d","#efd87c","#e8d29b","#ed9929","#eaa351","#e9ad78","#e8b89f","#dc4d15","#df6845","#e38374","#e89ea4","#cb0101","#d42d39","#de5971","#e885a9"],
                                      "name": "Anarchy","size":4},
                        {"myArray":[0,14,13,3,10,7,6,5,11,9,4,8,12,1,2,15],"myColors": ["#ffc2ce","#d4bdde","#aab8ee","#80b3ff","#cd9396","#c096ab","#b599c1","#a99cd8","#9b655e","#ad6f79","#c07a94","#d385b1","#693726","#9a4947","#cb5b68","#fd6e8a"],
                                      "name": "Pink Elephant","size":4},
                        {"myArray":[0,7,10,3,11,14,6,1,8,13,2,4,12,9,5,15],"myColors": ["#6d0839","#8e5259","#af9c79","#d0e799","#904643","#926652","#948661","#97a770","#b4844d","#977a4b","#7a7049","#5e6747","#d8c358","#9c8f44","#605b31","#25271e"],
                                      "name": "Nom-De-Plume","size":4},
                        {"myArray":[0,1,13,3,6,10,4,9,8,7,5,14,12,2,11,15],"myColors": ["#ffffc8","#ffeead","#ffde93","#ffce79","#ddefcb","#e8deae","#f2ce93","#fdbe78","#bce0ce","#d1cfb0","#e5be93","#fbae77","#9bd1d1","#bac0b2","#d9af94","#f99e76"],
                                      "name": "Notice Me Senpai","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#180f01","#655d52","#b2aca3","#fffbf5","#463a25","#786a52","#a99a7f","#dbcbad","#746549","#8b7752","#a1895c","#b89b66","#a3906d","#9e8453","#997839","#956c1f"],
                                      "name": "Tabby Cat","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#f0dfab","#f0979a","#f04f89","#f10879","#eacb7d","#eea58a","#f17e97","#f559a4","#e5b74f","#ecb37a","#f2aea5","#faaad0","#e0a421","#eac16a","#f4deb3","#fffcfc"],
                                      "name": "Cherry Club","size":4},
                        {"myArray":[0,10,13,3,4,2,9,7,14,6,1,11,12,5,8,15],"myColors": ["#680148","#6f3c6c","#767890","#7db4b5","#9a5585","#826080","#6b6c7c","#537878","#ccaac2","#968595","#606068","#293c3c","#ffffff","#aaaaaa","#555555","#000000"],
                                      "name": "Odd But Trendy","size":4},
                        {"myArray":[0,14,13,3,10,7,6,5,11,9,4,8,12,1,2,15],"myColors": ["#b4db75","#c9e78d","#def3a5","#f3ffbd","#c6e399","#c8e8aa","#caedba","#cdf2cb","#d9ebbe","#c8e9c7","#b7e7cf","#a7e6d9","#ecf3e3","#c8eae4","#a4e2e5","#81dae7"],
                                      "name": "Ambigous Freshness","size":4},
                        {"myArray":[0,7,10,3,11,14,6,1,8,13,2,4,12,9,5,15],"myColors": ["#ff9900","#ba993e","#76997c","#3299bb","#c07c16","#a48e51","#89a18d","#6fb3ca","#815f2c","#8e8365","#9da99f","#acced9","#424242","#797979","#b1b1b1","#e9e9e9"],
                                      "name": "Odd But Hip","size":4},
                        {"myArray":[0,1,13,3,6,10,4,9,8,7,5,14,12,2,11,15],"myColors": ["#95aa61","#aabe6e","#c0d27c","#d6e68a","#697746","#909e67","#b8c589","#e0ecab","#3d452b","#777e60","#b1b896","#ebf2cc","#121310","#5e5f5a","#aaaba4","#f6f8ee"],
                                      "name": "Panda VS Bamboo","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#65594d","#6b6055","#72685d","#797066","#8a806b","#938a7a","#9c9589","#a59f99","#afa789","#bbb49f","#c6c2b5","#d2cfcc","#d5cfa7","#e3dfc4","#f1efe1","#ffffff"],
                                      "name": "All or Nothing","size":4},
                        {"myArray":[0,14,13,3,10,7,6,5,11,9,4,8,12,1,2,15],"myColors": ["#e73f3f","#c46b33","#a19727","#7fc31c","#e7773c","#c28c45","#9da14e","#79b658","#e7af39","#c0ad57","#99ab75","#73a994","#e7e737","#bece6a","#95b59d","#6d9dd1"],
                                      "name": "Podbird","size":4},
                        {"myArray":[0,7,10,3,11,14,6,1,8,13,2,4,12,9,5,15],"myColors": ["#f3e761","#efd383","#ecbfa5","#e9abc7","#e5d26c","#e6cc8e","#e9c7b1","#ebc2d4","#d7bd77","#dec69a","#e6cfbe","#edd9e2","#caa882","#d6c0a6","#e3d8cb","#f0f0f0"],
                                      "name": "A Lovely Jest","size":4},
                        {"myArray":[0,1,13,3,6,10,4,9,8,7,5,14,12,2,11,15],"myColors": ["#f8931f","#e0a75f","#c8bc9f","#b1d1e0","#f0ac50","#ddb86c","#cbc488","#b9d0a5","#e8c681","#dbc979","#cecc72","#c1cf6b","#e1e0b2","#d9da87","#d1d45c","#c9cf31"],
                                      "name": "Citrus","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#fffcf2","#c6b6b2","#8d7072","#552b33","#dfaea4","#c18780","#a35f5d","#85393a","#bf6156","#bc584f","#b94f48","#b64742","#9f1409","#b7291e","#cf3f34","#e7554a"],
                                      "name": "Scarlet Letter","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#dd4814","#e45618","#eb641c","#f37320","#bb3b32","#bc4531","#be4f30","#c15930","#992e50","#95344a","#923a45","#8f4040","#77216f","#6e2364","#66255a","#5e2750"],
                                      "name": "Ubuntu","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#f02401","#c75600","#9f8900","#77bc00","#ab4c55","#a87038","#a6951c","#a4ba00","#6674a9","#898a70","#ada138","#d1b800","#219dfd","#6ba5a8","#b5ae54","#ffb700"],
                                      "name": "Microsoft","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#ff9245","#aa9a72","#55a29f","#00aacc","#f68039","#b68256","#768473","#358790","#ee6e2d","#c26a3a","#976747","#6b6454","#e65d22","#cf531e","#b84a1b","#a14118"],
                                      "name": "Firefox","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#a4c639","#b3cf5a","#c2d87b","#d1e29c","#b9d26a","#b1c674","#aabb7d","#a2b086","#cede9c","#b0be8e","#929e7f","#747e71","#e4ebce","#afb6a8","#7a8182","#464d5c"],
                                      "name": "Android","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#4bb648","#48a777","#4598a7","#438ad7","#7e8e42","#7e945c","#7f9a77","#80a292","#b1663d","#b58142","#b99d47","#beba4d","#e53e38","#ec6f28","#f4a018","#fcd208"],
                                      "name": "Chrome","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#158f76","#1fa078","#2ab17b","#35c27e","#197979","#22887e","#2c9684","#37a58a","#1d647d","#257085","#2f7b8d","#398896","#214f81","#29588c","#326197","#3b6ba2"],
                                      "name": "Mavericks","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#99cfaf","#b4d4a1","#cfd993","#ebdf86","#a7ba94","#bcc290","#d1cb8d","#e6d48a","#b5a67a","#c4b180","#d3bd87","#e2c98e","#c49260","#cca070","#d5af81","#debe92"],
                                      "name": "Weekend Getaway","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#846877","#ad8785","#d6a694","#ffc6a3","#ad7c84","#c79895","#e1b5a7","#fcd2b9","#d69092","#e1aaa6","#edc4ba","#f9dfcf","#ffa4a0","#fcbcb7","#f9d4ce","#f7ece6"],
                                      "name": "Fair Maiden","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#c0392b","#cd3f30","#da4536","#e74c3c","#ce766d","#d97b71","#e48177","#ef877d","#ddb3af","#e5b8b3","#eebdb8","#f7c3be","#ecf0f1","#f2f5f5","#f8fafa","#ffffff"],
                                      "name": "Pokeball","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#f9fbe3","#f9e8b5","#f9d587","#f9c25a","#f1f8bd","#ebd89e","#e5b97f","#df9a62","#eaf597","#ddc987","#d19d78","#c5726a","#e3f271","#d0ba71","#bd8271","#ab4b72"],
                                      "name": "Vibrant","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#42c1f6","#80c4b6","#bec876","#fccc36","#77d1c9","#a3c8a0","#cfc076","#fbb84d","#ade19d","#c6cd8a","#e0b977","#faa564","#e3f271","#ead274","#f2b278","#fa927c"],
                                      "name": "JoyStar","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#0290ab","#3ab4bd","#72d9cf","#aafee2","#48acc4","#71b5b5","#9abfa7","#c3c999","#8ec8dd","#a8b6ae","#c2a57f","#dc9450","#d4e5f6","#dfb8a6","#ea8c56","#f66007"],
                                      "name": "Koi","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#f8da74","#f8b884","#f89695","#f874a6","#f8b875","#e6947d","#d47087","#c34d90","#f89676","#d47077","#b14b79","#8e267b","#f87477","#c34d71","#8e266b","#590066"],
                                      "name": "Nolas","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#3fb8af","#72c2ac","#a6cda9","#dad8a7","#7f8f9f","#a1a0a0","#c3b2a1","#e6c4a3","#bf668f","#d07e94","#e1979a","#f2b1a0","#ff3d7f","#ff5d89","#ff7d93","#ff9e9d"],
                                      "name": "#nofilter","size":4},
                        {"myArray":[0,14,4,3,2,6,5,13,10,9,11,8,12,7,1,15],"myColors": ["#313930","#41414a","#524a65","#635380","#404640","#4d4c58","#5b5371","#685a8a","#4f5351","#595767","#645c7d","#6e6194","#5f6062","#666276","#6d658a","#74689f"],
                                      "name": "Purple","size":4},

                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#6dd3ce","#83d8c2","#9adeb7","#b1e3ab","#c8e9a0","#7aadb3","#8fb7ab","#a6c2a4","#bdcc9c","#d3d796","#878898","#9c9795","#b3a692","#c9b58e","#dfc58c","#94627d","#a9767e","#bf8a7f","#d59e80","#ebb382","#a13d63","#b65668","#cc6f6d","#e18872","#f7a278"],
                                      "name": "Faded","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,6,13,3,24],"myColors": ["#7ca982","#668e6f","#50735c","#3a5849","#243e36","#9cbc7c","#88a36b","#738a5a","#5f7149","#4b5838","#bcd076","#aab967","#97a158","#858a49","#73733a","#dce470","#ccce63","#bbb856","#aaa349","#9a8d3c","#fdf86a","#eee45f","#dfd054","#d0bc49","#c2a83e"],
                                      "name": "Fresh Lemons","size":5},
                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#247ba0","#5a618d","#91487a","#c82f67","#ff1654","#378ca4","#677c97","#996e89","#ca5f7b","#fc506e","#4a9ea9","#7598a1","#a19499","#cd8f90","#f98a88","#5dafae","#82b4ab","#a9baa8","#cfbfa5","#f6c4a2","#70c1b3","#90d0b5","#b1e0b8","#d2efba","#f3ffbd"],
                                      "name": "Ice Cream","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#d7ffab","#a7eeaf","#77deb3","#47ceb7","#17bebb","#bcd093","#a1cf98","#86cf9d","#6bcea2","#50cea7","#a2a27b","#9bb081","#95c087","#8fcf8d","#89de93","#877363","#95916a","#a4b171","#b3cf78","#c2ee7f","#6d454c","#907354","#b4a25c","#d8d064","#fcff6c"],
                                      "name": "Pale Spring","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#d81159","#be417a","#a5719b","#8ca1bc","#73d2de","#e03951","#bf5a6e","#9f7b8b","#7e9ca8","#5ebec6","#e9614a","#c17363","#99857c","#719795","#4aaaaf","#f28943","#c28c58","#938f6d","#649282","#359697","#fbb13c","#c4a54d","#8e9a5e","#578e6f","#218380"],
                                      "name": "Florindo","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#10a5ba","#1492a5","#198090","#1e6d7b","#235b66","#4bae98","#489f88","#459077","#438167","#407357","#87b876","#7cac6b","#72a15f","#689654","#5e8b49","#c3c254","#b0b94e","#9fb247","#8daa40","#7ca33a","#ffcc33","#e5c731","#ccc32f","#b3bf2d","#9abb2c"],
                                      "name": "Spring","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#348aa7","#3b7692","#42627e","#494e6a","#513b56","#56a19e","#559190","#548082","#537075","#546168","#78b895","#6fac8e","#679f87","#5e9380","#57877a","#9acf8c","#89c78c","#79be8c","#69b58b","#5aad8c","#bce784","#a4e28a","#8cdd91","#74d897","#5dd39e"],
                                      "name": "Caribean","size":5},
                        {"myArray":[0,9,12,21,4,15,23,7,8,1,19,18,5,22,10,17,14,16,11,2,20,3,6,13,24],"myColors": ["#594236","#5e473b","#644d40","#695245","#6f584b","#6e483c","#765548","#806254","#896e60","#937b6d","#834f42","#8f6355","#9d7768","#a98a7b","#b79e8f","#985648","#a87162","#b98c7c","#c9a696","#dbc1b1","#ad5d4e","#c17f6f","#d6a191","#eac3b2","#ffe5d4"],
                                      "name": "Mocha","size":5},
                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#b5ffe1","#a1edcd","#8ddbb9","#79c9a5","#65b891","#9be1cb","#87cdb5","#73b99f","#5fa589","#4b9373","#81c3b6","#6dad9e","#5a9886","#46826e","#326e56","#67a5a1","#538d86","#40766c","#2c5f52","#194938","#4e878c","#3a6e6f","#275553","#133c37","#00241b"],
                                      "name": "Spearmint","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#f4ff00","#c1ef37","#8edf6f","#5bcfa7","#29c0df","#f2dd03","#bdcb31","#88b95f","#53a78d","#1e96bb","#f1bb07","#baa72b","#82934f","#4b7f73","#146c98","#f0990b","#b68325","#7c6d3f","#435759","#0a4274","#ef770f","#b35f1f","#774830","#3b3040","#001951"],
                                      "name": "Van Gogh","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#353535","#313a40","#2e404c","#2b4557","#284b63","#364344","#3d4d52","#455862","#4c6371","#546e80","#385153","#4a6165","#5c7178","#6e818b","#80929e","#3a5f62","#567478","#738a8e","#8f9fa5","#acb5bb","#3c6e71","#63888b","#8aa3a5","#b1bebf","#d9d9d9"],
                                      "name": "Hues","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#ffb8ed","#d89bc4","#b17e9b","#8a6172","#63444a","#fac9d5","#d7afba","#b3959f","#907a84","#6c6069","#f6dbbd","#d6c3b0","#b6aca3","#969496","#767d89","#f2eda5","#d5d7a6","#b8c3a7","#9caea8","#7f99a9","#eeff8d","#d4ec9c","#bbdaab","#a2c8ba","#89b6c9"],
                                      "name": "Magia","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,13,3,6,24],"myColors": ["#261447","#593650","#8c5859","#bf7a62","#f39c6b","#5c1d4e","#773753","#915157","#ac6b5c","#c88561","#922655","#953856","#974a56","#9a5c57","#9d6e57","#c82f5c","#b33959","#9d4355","#874d51","#72574d","#ff3864","#d13a5c","#a33c54","#753e4c","#474044"],
                                      "name": "Amethyst","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#ffa7ac","#fe979d","#fe878e","#fe777f","#fe6770","#ffbbac","#f6a49b","#ee8d8a","#e67679","#de6069","#ffcfad","#eeb19a","#df9487","#cf7674","#bf5962","#ffe3ae","#e6be99","#cf9a84","#b7766f","#a0525b","#fff7af","#dfcc98","#c0a181","#a0766a","#814c54"],
                                      "name": "I'm Sorry","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,13,3,6,24],"myColors": ["#ff440a","#ff723c","#ffa16e","#ffd0a0","#ffffd2","#d14013","#cd6d43","#c89a72","#c3c7a2","#bff5d2","#a43d1d","#9b684a","#929377","#88bfa5","#7febd2","#773926","#696351","#5b8c7c","#4db6a7","#3fe1d2","#4a3630","#375e58","#258681","#12aeaa","#00d7d3"],
                                      "name": "Pop Art","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#00ffff","#3fccf2","#7f99e5","#bf66d8","#ff33cc","#3fffbf","#5fc8b5","#7f92ab","#9f5ca2","#bf2699","#7fff7f","#7fc579","#7f8c72","#7f526c","#7f1966","#bfff3f","#9fc23c","#7f8539","#5f4836","#3f0c33","#ffff00","#bfbf00","#7f7f00","#3f3f00","#000000"],
                            "name": "CMYK","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#fffaad","#dee8aa","#bed6a7","#9dc4a4","#7db3a1","#ffe8a8","#e4d6a4","#cac3a0","#b0b19d","#96a099","#ffd6a3","#ebc49e","#d7b19a","#c39f96","#b08d92","#ffc49e","#f1b298","#e49f94","#d68c8f","#c97a8a","#ffb399","#f8a093","#f18d8e","#ea7a88","#e36883"],
                            "name": "Your Lie In Apirl","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#f7da57","#f7be4b","#f7a33f","#f78833","#f76d28","#c8b258","#d29d50","#dc8947","#e6753f","#f06137","#998a5a","#ad7d55","#c17050","#d5634b","#e95647","#6a625b","#885c5a","#a65659","#c45057","#e24b57","#3c3b5d","#643c5f","#8c3d62","#b43e64","#dc4067"],
                            "name": "Warm Feelings","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#3fb8af","#65c0ad","#8cc8ab","#b3d0a9","#dad8a7","#6f99a3","#88a4a2","#a2afa2","#bbbba1","#d5c6a1","#9f7a97","#ab8998","#b89799","#c4a69a","#d1b49c","#cf5b8b","#ce6d8d","#ce7f90","#cd9193","#cda296","#ff3d7f","#f15283","#e46788","#d67c8c","#c99191"],
                            "name": "#nofilter","size":5},
                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#f9fbe3","#f9ecc0","#f9de9e","#f9d07c","#f9c25a","#f3f8c6","#f0e3ac","#ecce92","#e9b979","#e5a460","#eef6aa","#e7da98","#e0be87","#d9a276","#d28666","#e8f48d","#ded184","#d3ae7c","#c98b73","#be686c","#e3f271","#d5c871","#c79e71","#b97471","#ab4b72"],
                            "name": "Vibrant","size":5},
                        {"myArray":[0,9,12,21,4,15,23,7,8,1,19,18,5,22,10,17,14,16,11,2,20,3,6,13,24],"myColors": ["#762b81","#704385","#6b5c89","#65758d","#608e92","#8e3170","#8b4871","#895f73","#877674","#858e76","#a63860","#a64d5e","#a8635d","#a9785b","#aa8e5a","#be3f4f","#c1524b","#c66647","#cb7a42","#cf8e3e","#d6463f","#dd5838","#e56a31","#ed7c2a","#f58f23"],
                            "name": "Midnight","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#ff5a2e","#bf7957","#7f9880","#3fb7a9","#00d7d3","#ff7a3b","#cf935e","#9fac82","#6fc5a5","#3fdfc9","#ff9b48","#dfae66","#bfc184","#9fd4a1","#7fe8c0","#ffbb55","#efc86d","#dfd686","#cfe39d","#bff1b6","#ffdc63","#ffe375","#ffeb88","#fff29a","#fffaad"],
                            "name": "Summer Time","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,13,3,6,24],"myColors": ["#55375d","#76395f","#983b62","#ba3d64","#dc4067","#7a667f","#946578","#af6372","#c9626b","#e46165","#a096a2","#b39192","#c68c83","#d98773","#ec8364","#c6c6c4","#d1bdab","#ddb593","#e8ac7a","#f4a462","#ecf6e7","#f0eac5","#f4dea4","#f8d282","#fdc661"],
                            "name": "Middle School Crush","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#7a6b5f","#9b7b48","#bc8c31","#dd9d1a","#feae03","#5c8075","#7d8e64","#9e9d52","#bfac40","#e0bb2f","#3e968c","#5fa280","#80af74","#a1bb67","#c2c85b","#20aca3","#41b69c","#62c095","#83ca8e","#a4d587","#03c2ba","#23cab8","#44d2b7","#65dab5","#86e3b4"],
                            "name": "Surf's Up","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#f8da74","#f8c080","#f8a78d","#f88d99","#f874a6","#f8c074","#eea57c","#e48b85","#da718d","#d05796","#f8a775","#e48b79","#d0707d","#bc5581","#a83a86","#f88d76","#da7175","#bc5575","#9e3975","#801d76","#f87477","#d05772","#a83a6e","#801d6a","#590066"],
                            "name": "Nolas","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#0290ab","#2cabb8","#56c7c6","#80e2d4","#aafee2","#36a5bd","#58b1b8","#79bdb4","#9bc9af","#bdd6ab","#6bbad0","#84b7b9","#9db4a2","#b6b18b","#d0af74","#9fcfe3","#b0bdb9","#c1ab90","#d19966","#e3873d","#d4e5f6","#dcc3ba","#e5a27e","#ed8142","#f66007"],
                            "name": "Koi Pond","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#ea0b69","#dc4361","#ce7b59","#c0b351","#b2ec4a","#ef324e","#d55e57","#bb8b60","#a2b768","#88e572","#f45934","#cf7a4d","#a99b67","#84bc80","#5ede9a","#f9801a","#c89543","#97ab6e","#66c097","#34d7c2","#ffa700","#c2b13a","#85bb75","#48c5af","#0bd0ea"],
                            "name": "Preschool","size":5},


                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#edcd59","#e8ac5a","#e48c5b","#e06b5c","#dc4b5d","#eebe53","#dfa056","#d18258","#c2645a","#b4475d","#f0b04e","#d79452","#be7955","#a55e59","#8c435d","#f2a149","#ce884e","#ab7052","#875757","#643f5d","#f49344","#c67d4a","#986750","#6a5156","#3c3b5d"],
                            "name": "Subconscious Burst","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,6,13,3,24],"myColors": ["#ecf6e7","#efe6ce","#f3d7b6","#f6c79e","#fab886","#eef0d4","#f0dec0","#f2ceac","#f4bd99","#f7ac85","#f1eac2","#f1d7b2","#f2c5a3","#f3b394","#f4a185","#f3e4b0","#f2d0a4","#f2bc9a","#f1a98f","#f19684","#f6de9e","#f4c997","#f2b491","#f09f8a","#ee8b84"],
                            "name": "On The Balcony","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#693a6a","#853f6c","#a2446f","#be4972","#db4f75","#7c636f","#956873","#af6d79","#c9727e","#e37884","#8f8c74","#a6917b","#bd9783","#d49c8b","#eba293","#a2b579","#b6ba82","#cbc08d","#dfc697","#f3cca2","#b6df7e","#c7e48a","#d9ea97","#eaf0a4","#fcf6b1"],
                            "name": "Llamas Like Apples","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#fcecbc","#bde0cc","#7ed4dd","#3fc8ee","#00bdff","#d3c59e","#a1b9a8","#6eacb2","#3ca0bc","#0995c6","#ab9e81","#859284","#5f8587","#39798a","#136d8e","#837764","#696b60","#4f5e5c","#365158","#1c4555","#5b5147","#4d443c","#403732","#332a27","#261d1d"],
                            "name": "On The Rocks","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#1e3264","#4a6264","#769364","#a2c464","#cef564","#1c5e6d","#3c8172","#5ba576","#7bc97b","#9aed7f","#1b8b77","#2ea180","#41b889","#54cf92","#67e69b","#1ab881","#20c18e","#26cb9c","#2dd4a9","#33deb7","#19e58b","#12e19d","#0cdeaf","#06dac1","#00d7d3"],
                            "name": "Midsummer Dream","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#fa75af","#f997bf","#f9bad0","#f9dce1","#f9fff2","#f597b5","#efadbd","#eac4c5","#e5dace","#e0f1d7","#f0babb","#e5c4bb","#dbcebb","#d1d8bc","#c7e3bd","#ebdcc1","#dbdab9","#ccd8b1","#bdd6a9","#aed5a2","#e6ffc7","#d2f1b7","#bee3a7","#aad597","#96c888"],
                            "name": "Watermelon","size":5},
                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#dbbc6b","#bf8f5e","#a36352","#873645","#6b0a39","#cd9166","#b9765d","#a65c55","#92424c","#7e2844","#c06662","#b45e5d","#a95659","#9d4e54","#914750","#b33b5d","#af455c","#ac505c","#a85a5b","#a4655b","#a61159","#aa2d5c","#af4a60","#b36763","#b88467"],
                            "name": "Spiced Vanilla","size":5},
                        {"myArray":[0,9,12,21,4,15,23,7,8,1,19,18,5,22,10,17,14,16,11,2,20,3,6,13,24],"myColors": ["#fd7f82","#e19f82","#c6bf82","#abdf82","#90ff82","#fd9f82","#e0b28a","#c4c691","#a8da99","#8beea1","#febf83","#e0c692","#c2cea1","#a5d5b1","#87ddc0","#fedf83","#dfda9a","#c0d5b1","#a2d0c8","#83ccdf","#ffff84","#dfeea2","#bfddc1","#9fcce0","#7fbcff"],
                            "name": "RGBY","size":5},
                        {"myArray":[0,12,6,19,4,18,2,22,1,23,17,14,13,8,11,16,15,10,5,3,20,21,7,9,24],"myColors": ["#95c4a8","#96ad9f","#979797","#98808f","#996a87","#abd1b4","#acbaa9","#aca49f","#ad8e95","#ad788b","#c2dec0","#c2c8b3","#c2b2a7","#c29c9b","#c28790","#d9ebcc","#d8d5bd","#d7c0af","#d7aaa1","#d69594","#f0f8d8","#eee3c8","#edceb8","#ecb9a8","#eba499"],
                            "name": "Appeasing Your Date","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#406b7c","#4d8e88","#5bb294","#68d5a0","#76f9ad","#345765","#4c7f7c","#64a892","#7cd1a8","#95fabf","#29444f","#4b7170","#6e9f90","#91cdb1","#b4fbd2","#1d3039","#4a6364","#78968e","#a5c9b9","#d3fce4","#121d23","#4a5558","#828d8d","#bac5c2","#f2fdf7"],
                            "name": "Sensei","size":5},
                        {"myArray":[0,11,22,23,4,15,17,7,8,19,13,1,12,10,14,5,21,6,18,9,20,16,2,3,24],"myColors": ["#f8d97c","#f9c76f","#fbb663","#fda456","#ff934a","#f1b574","#e7a667","#dd985c","#d4894f","#cb7b44","#ea926c","#d58660","#c07a55","#ac6e49","#97633e","#e36e64","#c36559","#a35c4e","#835343","#634b38","#dc4b5d","#b14552","#863f48","#5b393d","#303433"],
                            "name": "Gurren","size":5},
                        {"myArray":[0,10,8,16,4,18,9,23,2,6,1,14,19,21,11,13,3,22,5,12,20,15,17,7,24],"myColors": ["#486a97","#73839b","#9f9d9f","#cbb6a3","#f7d0a7","#3d5981","#5f6c83","#828086","#a69488","#c9a88b","#32486c","#4c566c","#66646d","#81726e","#9c816f","#273756","#383f55","#4a4854","#5c5053","#6e5953","#1c2641","#25293e","#2e2c3c","#372f39","#413237"],
                            "name": "Manliness","size":5},
                        {"myArray":[0,23,10,22,4,21,6,7,8,9,2,18,15,14,13,12,19,16,11,17,20,5,3,1,24],"myColors": ["#8e076e","#a71d60","#c13452","#db4b44","#f56237","#90408d","#a94c75","#c3595e","#dc6646","#f6732f","#9379ad","#ab7c8b","#c57f6a","#de8249","#f88528","#95b2cc","#adaba1","#c7a476","#e09d4b","#f99621","#98ecec","#b0dbb7","#c9ca83","#e2b94e","#fba81a"],
                            "name": "Going Somewhere","size":5},
                        {"myArray":[0,9,12,14,4,15,23,7,8,1,19,18,5,22,21,10,17,16,11,2,20,13,3,6,24],"myColors": ["#1ccb90","#2b9885","#3a657b","#493270","#590066","#54d697","#5fa88e","#6a7986","#754a7d","#801d76","#8de29e","#94b898","#9a8e92","#a1638b","#a83a86","#c6eea5","#c8c8a1","#caa29d","#cd7c99","#d05796","#fffaad","#fdd8ab","#fbb7a9","#f995a7","#f874a6"],
                            "name": "Spellbound","size":5},

        ]}
        }

    /*SoundEffect {
        id:playSound
        source: "zensecondclick.wav"
    }*/

    Item {
        id:check
        property int phase: 0;
        function anime(){
            if(check.phase === 0){
                check.phase = 1;
        } else if(check.phase === 1){
            check.phase = 2;
        }else{
                check.phase = 0;
            }
        }
            Timer {
                interval: 3500; running: true; repeat: true
                onTriggered:{
                    check.anime();
                    //print(check.phase)
                    check.day(); }
            }

            function day() {
                //property var m: month[n];
                 Logic.checkDay();
                if (userSettings.contents.day === Logic.checkDay()) {

                } else if(userSettings.contents.day === 0){
                    userSettings.contents = {"nulvl": userSettings.contents.nulvl, "day": Logic.checkDay(), "hint": userSettings.contents.hint}
                }else{
                    userSettings.contents = {"nulvl": userSettings.contents.nulvl, "day": Logic.checkDay(), "hint": 10}
                }
            }

        }

    PageStack{
        id:stack
        Component.onCompleted: stack.push(home)
    }

    Page {
        id:home
        title: ""
        visible:false
        height:parent.height
        width:parent.width
        property int nulvl:0 //userSettings.contents.nulvl;
        Grid{
            id:grid1
        height:parent.height
        width:parent.width
        columns: 3
        spacing:0

        Rectangle { color:open.contents.stages[check.phase].lvl[0]; width: parent.width/4; height: parent.height/3
            Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
        }
            Rectangle { color:open.contents.stages[check.phase].lvl[1]; width: parent.width/2; height: parent.height/3
                Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                Item { // container for the custom header include settings, title and add
                    id:diyHeader
                    anchors.centerIn: parent
                    height:diyTitle.height // set in main.qml
                    width:parent.width
                    Label { //calorie title for app
                        id:diyTitle
                        fontSize:"x-large"
                        font.weight: Font.Light;
                        anchors.centerIn: parent;
                        color:"white"
                        text: "Chromatic"
                        font.letterSpacing: units.gu(.5)
                    }
                    Label{
                        text:"relating to colors";
                        fontSize:"small"
                        color:"white"
                        anchors{
                            horizontalCenter: parent.horizontalCenter
                            top:parent.bottom
                            topMargin:units.gu(2)
                        }
                    }
                }//end of item

            }
            Rectangle { color:open.contents.stages[check.phase].lvl[2]/*color: "#dad8a7"*/; width: parent.width/4; height:parent.height/3
                Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
            }
            //middle row
            Rectangle { color: open.contents.stages[check.phase].lvl[3]; width: parent.width/4; height: parent.height/3
                Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
            }
                Rectangle { color: open.contents.stages[check.phase].lvl[4]; width: parent.width/2; height: parent.height/3
                    Icon{
                        name:"media-playback-start"
                        height:units.gu(3)
                        width:units.gu(3)
                        anchors.centerIn: parent
                        color:"white"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            home.nulvl =userSettings.contents.nulvl;
                            stack.push(easyLvl)
                            //playSound.play();

                        }
                    }
                }
                Rectangle { color: open.contents.stages[check.phase].lvl[5]; width: parent.width/4; height:parent.height/3
                    Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                }
                //bottom row
                Rectangle { color: open.contents.stages[check.phase].lvl[6]; width: parent.width/4; height: parent.height/3
                    Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                }
                    Rectangle { color: open.contents.stages[check.phase].lvl[7]; width: parent.width/2; height: parent.height/3
                        Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                        Column{
                            width:parent.width
                            height:parent.height/2
                            anchors.centerIn: parent
                            spacing:units.gu(5)
                            Label{
                                text:"How to play"
                                color:"white"
                                fontSize:"large"
                                anchors.horizontalCenter: parent.horizontalCenter
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: stack.push(help)//PopupUtils.open(help)
                                }
                            }
                        }
                    }

                    Rectangle { color: open.contents.stages[check.phase].lvl[8]; width: parent.width/4; height:parent.height/3
                    Behavior on color {ColorAnimation {duration: UbuntuAnimation.SleepyDuration; easing: UbuntuAnimation.StandardEasing}}
                    }

        }
        //}

    }
        Help{
            id:help
        }
    EasyGrid{
    id:easyLvl
    width:parent.width
    height:parent.height
    }
   //}


}

