:::mermaid
sequenceDiagram
    participant V as View (UI)
    participant P as Presenter
    participant PC as PipeClient (Model)
    participant N as NavigationController
    participant W as Window (UI Container)

    Note over V,P: after user interaction

    V ->>+ P: requestAction(data)
    alt invalid data
        P -->> V: displayError(msg)
    else valid data
        P ->>+ PC: sendRequest(req)
        PC -->>- P: response
        alt error response
            P -->> V: displayError(msg)
        else success response
            P ->>+ N: navigateNext(event)
            N ->>+ W: setView(newView)
            W -->>- N: updated UI
            destroy V
            P --x- V: destroy()
            destroy P
            N --x- P: destroy()
        end
    end
:::