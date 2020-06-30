[Significato di Responsive e Adaptive](#significato-di-responsive-e-adaptive)
 * [Cosa significa responsivo](##cosa-significa-responsivo)
 * [Cosa significa adattivo](#adattarsi-all-so)
 * [Come essere Adaptive e Responsive](#come-raggiungere-gli-obiettitvi-adaptive-responsive)
  
[Calcolo delle dimensioni in modo dinamico](#calcolare-le-dimensioni-in-modo-dinamico)
 * [MEDIQUERY per ricavare le dimensioni](#classe-mediaquery-per-il-calcolo-delle-dimensioni)
 * [Calcolare lo spazio a disposizione di un widget](#calcolare-lo-spazio-a-disposizione-di-un-widget)
 * [TextScaleFactor](#mediaquery-textscalefactor)
 * [Adattare le dimensioni di un widget a seconda del widget padre](#adattare-le-dimensioni-di-un-widget-a-seconda-del-widget-padre-layout-builder-udemy-n119)
 * [Gestire cambio di orientamento del dispositivo](#gestire-cambio-di-orientamento-del-dispositivo)
 * [Calcolare la parte di schermo oscurata dalla tastiera](#calcolare-la-parte-di-schermo-oscurata-dalla-tastiera-udemy-n124)
  
[Adattare lo stile ai diversi OS](#adattare-lo-stile-sui-differenti-os)
 * [Scaffold per le app IOS](#scaffold-per-le-app-ios-lezione-128)
   * [Gestire differenti scaffold](#gestire-differenti-scaffold)
 * [Cupertino NavigationBar](#cupertino-navigationbar)
 * [Fixare visualizzazione del body per IOS](#fixare-visualizzazione-del-body-per-ios) 


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
# Adattare lo stile sui differenti OS (LEZIONE 127)
Alcuni widget hanno un costruttore *adaptive* che in automatico cambierà lo stile del widget a seconda che si trovi su *android* o su *IOS*.

*Esempio:*
``` Dart
   Switch.adaptive(
      value: true,
      onChanged: (){},
   );
```
Il *FloatingActionButton* non é uno standard per le app *IOS*, per questo motivo va utilizzato solo se ci troviamo su *Android*.

```Dart
   import 'dart:io'

   Platform.isAndroid ?  FloatingButton(...) : 
```
## Scaffold per le app IOS (LEZIONE 128)
Per le app *Android* utilizziamo lo *Scaffold* per impaginare gli elementi di un applicazione (app bar, body, floating button, ecc...),

Per fare ciò su *IOS* abbiamo un altro widget del package `flutter/cupertino.dart` chiamato `CupertinoPageScaffold`.

Differenze tra *Scaffold* material e *CupertinoPageScaffold*:

1. A differenza del normale *scaffold* material quest'ultimo non ha un body ma il contenuto della pagina andrà nella proprietà `child`.
2. *CupertinoPageScaffold* non ha un *appBar* ma un a *navigationBar*

### Gestire differenti Scaffold
Nello `State` principale della nostra app tramite la condizione Platform.isIOS o Platform.isAndroid possiamo selezionare lo scaffold da usare:

```Dart
   Widget build(/*param*/) {
      return Platform.isIOS ? 
      CupertinoPageScaffold(/*code*/):
      Scaffold(/*code*/);
   }

```

Per gestire i differenti body una strategia strategia può essere quella di memorizzare in una variabile il contenuto della pagina della nostra app:

```Dart   
   //....Code
   Widget build(/*param*/) {
      final body = Container(/* contenuto */);

      return Platform.isIOS ? 
      CupertinoPageScaffold(child: body,/*code*/):
      Scaffold(body: body,/*code*/);
   }
```

Per gestire le differenti AppBar usiamo la stessa strategia usata per il body, ma con una differenza:
la variabile appBar la dichiariamo come tipo *PreferredSizwWidget* perchè *Dart* usanto l'operatore di condizione ternario non sa dedurre il tipo della variabile di conseguenza non potremmo accedere alla proprietà *preferred size*:


```Dart   
   //....Code
   Widget build(/*param*/) {
      final body = Container(/* contenuto */);
      final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
           //content
        )
        : AppBar(
           //Content
          );

      return Platform.isIOS ? 
      CupertinoPageScaffold(child: body,/*code*/):
      Scaffold(body: body,/*code*/);
   }
```


## Cupertino NavigationBar
La proprietà *middle* é il titolo, la proprietà *trailing* sono le Actions

## Fixare visualizzazione del body per IOS (LEZIONE 129)
Per evitare che la navigation bar si sovrapponga con i widget del body circondiamo il body con un widget chiamato *SafeArea*.