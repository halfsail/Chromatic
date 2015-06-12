import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import "components/backend.js" as Logic
import U1db 1.0 as U1db
//import "components/levels.js" as Lvl

import "components"

MainView {
    id:levels
    objectName: "mainView"
    applicationName: "palette.kevinfeyder"
    useDeprecatedToolbar: false
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
          //stores waterlvl number, and user progress and end goal
          database: colors
          docId: "uSet"
          create: true
          defaults: { "nulvl": 0, "day": 0,"hint": 10,}
          contents: { "nulvl": 0, "day": 0,"hint": 10,}
        }

    U1db.Document {
          id: level00
          //stores todays expenes
          //database: color
          docId: "level01"
          //createChanged:true
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

        ]}
        }

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
                                    onClicked: PopupUtils.open(help)
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

