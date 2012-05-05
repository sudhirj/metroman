#MetroMan

MetroMan is a Metro-style layout manager for modern browsers. The Metro design language (as popularized by Microsoft with Windows 7) actually seems to be a fairly good way to organize a user interface, especially for web apps that might have to run on a variety of screen sizes. 

MetroMan aims to provide a configuration based approach to showing your views: you pass in a plain JavaScript object (maybe mapped directly from JSON?) that contains information about how you want the screen to look and where you want your views. 

Here's a typical Metro configuration:    

    var chatScreenConfig = {
        grid: {
            rows: 4,
            columns: 4
        },
        elements: [
            {
                view: userInfoView,
                height: 4,
                width: 1,
                position: {
                    x: 0,
                    y: 0
                }
            },
            {
                view: chatWindowView,
                height: 4, 
                width: 3,
                position: {
                    x: 1, 
                    y: 0
                }
            }
        ]
    }

The `userInfoView` and `chatWindowView` objects here can be anything that MetroMan can insert into a DOM node. Internally, there's a statement along the lines of `$(cell).append(userInfoView)` that does the actual insertion. 