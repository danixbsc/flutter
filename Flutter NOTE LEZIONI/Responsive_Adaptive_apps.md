[Significato di Responsive e Adaptive](#significato-di-responsive-e-adaptive)
 * [Cosa significa responsivo](##cosa-significa-responsivo)
 * [Cosa significa adattivo](#adattarsi-all-so)
 * [Come essere Adaptive e Responsive](#come-raggiungere-gli-obiettitvi-adaptive-responsive)
  
[Calcolo delle dimensioni in modo dinamico](#calcolare-le-dimensioni-in-modo-dinamico)
 * [MEDIQUERY per ricavare le dimensioni](#classe-mediaquery-per-il-calcolo-delle-dimensioni)
 * [Calcolare lo spazio a disposizione di un widget](#calcolare-lo-spazio-a-disposizione-di-un-widget)
 * [TextScaleFactor](#mediaquery-textscalefactor)


# Significato di Responsive e Adaptive

## Cosa significa responsivo:
Un app **responsive** si adatta a qualsiasi formato e dimensione del
dispositivo su cui viene eseguita.

> Che sia un telefono in **Protrait** o in  **Landscape** un 
> un **Tablem** una **tv** ecc..

## Adattarsi all SO:
L'app deve adattare il suio stile a secondo del sistema operativo su cui verrà eseguita.

## Come raggiungere gli obiettitvi (Adaptive, Responsive)
> L'app in  flutter é un **albero di widget** con un solo widget 
> in entrata.

Dobbiamo captare su che sistema operativo la nostra app viene eseguita,

> `if Platform.isIOS`

e cambiare le foglie dell'**albero dei widget** di conseguenza.

# Calcolare le dimensioni in modo dinamico (UDEMY: LEZIONE 117)

## Classe MEDIAQUERY per il calcolo delle dimensioni
 La classe mediaquery ci da informazioni riguardanti le dimensioni di un dispositivo

 > Classe del packege: `flutter/material.dart`

 > `MediaQuery.of(context).size.height`
 > ti da accesso all'altezza totale del dispositivo 

 Se ad esempio ad un contenitore vogliamo far prendere l'altezza del 60% del dispositivo possiamo scrivere

 > `Container( height: MediaQuery.of(context).size.height * 0.6 ...`

 ## Calcolare lo spazio a disposizione di un widget
 Per calcolare lo spazion a disposizione di un widget dobbiamo 
 1. ricavare tramite **MediaQuery** la dimensione del dispositivo;
 2. sottrarre la dimansione degli altri widget presenti sulla schermata;
   
    Per ricavare la dimensione di un Widget si utilizza la priprietà `preferredSize` -> che memorizza, ad esempio, l'altezza di un widget.

    > per poter accedere a questa proprietà il widget può essere memorizzato in una variabile.
 3. sottrarre il padding sulla pare superiore dell applicazione riservato alla barra di stato dello smartphone.
     > `MediaQuery.of(context).padding.top` -> per ricavare il padding superiore utilizzato per la barra di stato del dispositivo

## MEDIAQUERY textScaleFactor
**textScaleFactor** ci dice di quanto un testo deve essere scalato all'interno dell'applicazione.

> l'utente può cambiare questo dato dalle impostazioni del telefono.

Esempio di utilizzo del textScaleFactor:

``` Dart
final curScaleFactor = MediaQuery.of(context).textScaleFactor;
Text("This changes!", style: TextStyle(fontSize: 20 * curScaleFactor));
```


Il fontSize cambierà quindi a seconda dello scale factor.

## Adattare le dimensioni di un widget a seconda del widget padre (LAYOUT BUILDER) (UDEMY n.119)

Il WIDGET [**LayoutBuilder**](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) fornisce informazioni sui **costraints** del widget padre in modo da poter adattare di conseguenza le dimensioni del widget figlio

## Gestire cambio di orientamento del dispositivo
Flutter ha un widget chiamato **Switch** che che ha un **value** che può essere vero o falso se é attivo o meno.

In questo widget può essere memorizzata una funzione che viene eseguita nel momento in cui il valore viene cambiato.

## Calcolare la parte di schermo oscurata dalla tastiera (UDEMY n.124)
Grazie in Mediaquery la proprietà **viewInsets** di MediaQuery da informazioni sulla parte di schermo oscurata dalla UI.

La parte di UI occupata dalla tastiera si ottiene dalla proprietà **bottom** di viewInsets.

*Esempio: calcolare il padding inferiore di un container per far si che gli elementi siano al di sopra della tastiera:*

``` Dart
Container(
   padding: EdgeInsets.only(
      top: 10,
      left: 10,
      right: 10,
      bottom: MediaQuery.of(context).viewInsets.bottom + 10,
   )
)
```