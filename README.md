# π°π· λ§κ΅­λ°λν π°π·

## π λͺ©μ°¨

1. [μκ°](#-μκ°)
2. [νλ‘μ νΈ κ΅¬μ‘°](#-νλ‘μ νΈ-κ΅¬μ‘°)
3. [κ΅¬ν λ΄μ©](#-κ΅¬ν-λ΄μ©)
4. [νμλΌμΈ](#-νμλΌμΈ)
5. [μ€ν νλ©΄](#-μ€ν-νλ©΄)
6. [νΈλ¬λΈ μν & μ΄λ €μ λ μ ](#-νΈλ¬λΈ-μν--μ΄λ €μ λ-μ )
7. [μ°Έκ³  λ§ν¬](#-μ°Έκ³ -λ§ν¬)

## π± μκ°

`Aejong`, `Rhovin`μ΄ λ§λ  λ§κ΅­λ°λν μ±μλλ€.

- KeyWords
  - stackView
  - tableView
  - segue
  - decodable
  - reuse cell
  - json
  - Dynamic Type


## π  νλ‘μ νΈ κ΅¬μ‘°
### π UML
![](https://i.imgur.com/AMTpKL2.jpg)


### π² Tree

```
<Expo1900>
βββ Controllers
βΒ Β  βββ ItemCell.swift
βΒ Β  βββ ItemDetailViewController.swift
βΒ Β  βββ KoreanItemsViewController.swift
βΒ Β  βββ MainViewController.swift
βΒ Β  βββ NavigationController.swift
βββ Info.plist
βββ Models
βΒ Β  βββ Exposition.swift
βΒ Β  βββ Item.swift
βββ NameSpace
βΒ Β  βββ Converter.swift
βββ SupportingFiles
βΒ Β  βββ AppDelegate.swift
βΒ Β  βββ Base.lproj
βΒ Β  βΒ Β  βββ LaunchScreen.storyboard
βΒ Β  βββ SceneDelegate.swift
βββ Views
    βββ Base.lproj
    βΒ Β  βββ Main.storyboard
    βββ ItemDetail.storyboard

```

## π κ΅¬ν λ΄μ©

#### νλ©΄ UI κ΅¬ν
νλ©΄ UIλ₯Ό κ΅¬νν  λ, μ€ν λ¦¬λ³΄λμ μ½λλ₯Ό μ΄μ©νμ¬ κ΅¬ν


#### νλ©΄μ νμ λ°©μ
νλ‘μ νΈμμ `μ΄ 3κ°μ View`κ° μμ΄μ `2λ²μ νλ©΄μ ν`μ΄ μ΄λ£¨μ΄μ§κ³   navigationλ°©μμ ν΅ν΄ push,pop λλ€.
Segueλ₯Ό μ°λ λ°©μκ³Ό VCλ₯Ό μμ±ν΄μ pushν΄μ£Όλ λ°©μμΌλ‘ κ΅¬ν

- λ©μΈ -> νκ΅­μμΆνμ μΌλ‘ νλ©΄μ΄λν  λ λ°λ‘ λ°μ΄ν°λ₯Ό μ λ¬νμ§ μκΈ° λλ¬Έμ κ°λ¨νκ² λ²νΌμ actionμ `performSegue()`λ©μλλ₯Ό λ£μ΄ segueλ₯Ό ν΅ν΄ νλ©΄μ΄ μ νλκ² κ΅¬ν
- νκ΅­μμΆνμ -> cellμμΈ λ·° λ‘ νλ©΄μ΄λμ ν  λμλ `UITableViewDelegate`μ `tableView()`λ©μλ λ΄λΆμμ VCμ μΈμ€ν΄μ€λ₯Ό μμ±ν΄μ£Όκ³ , cellμ ν΄λΉνλ λ°μ΄ν°λ₯Ό μ λ¬λκ² κ΅¬ν


#### μ λ€λ¦­μ νμ©ν decode() λ©μλ κ΅¬ν
`[Item]` νΉμ `Exposition` νμμ ννλ‘ λμ½λ©ν΄μ£Όλ λ©μλ decode()λ₯Ό jsonDecoder.decode()λ©μλμ²λΌ μ λ€λ¦­μ ν΅ν΄ νμΌ λͺλ§ μλ ₯νλ©΄ νμΌμ λ§λ λ¦¬ν΄νμμ΄ λμ€λλ‘ κ΅¬ν

```swift
// jsonDecoder.decode() λ©μλ μ μ
open func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
```
---

μμ λΉμ·ν λ°©λ²μΌλ‘ λ§€κ°λ³μμ Modelμ νμμ μΆκ°ν΄μ€λ€λ©΄ Model νμμ λ§€κ°λ³μλ₯Ό ν΅ν΄ κ²°μ 
```swift
// λ©μλ μ μ
static func decode<Model: Decodable>(_ file: String) -> Model? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        
        let model = try? Converter.jsonDecoder.decode(Model.self, from: dataAsset.data)
        
        return model
    }

// λ©μλ μ¬μ©
exposition = Converter.decode(type: Exposition.self, "exposition_universelle_1900")
```



### λ©μΈνλ©΄ μΈλ‘λ‘λ§ λ³Ό μ μκ² κ΅¬ν
μ± λλ¦¬κ²μ΄νΈλ₯Ό μ΄μ©νλ λ°©λ²μ ν΅ν΄ μ²« λ²μ§Έ νλ©΄λ§ μΈλ‘λ‘ λ³Ό μ μκ² κ΅¬ννμ§λ§ `λͺ¨λ  λ·° μ»¨νΈλ‘€λ¬μμ λλ¦¬κ²μ΄νΈλ₯Ό μ¬μ©ν΄μΌ νλ€λ μ `, `μ± λλ¦¬κ²μ΄νΈμ κ²°ν©λκ° λμμ§λ μ `μ μ΄μ λ‘ λ€λΉκ²μ΄μ μ»¨νΈλ‘€λ¬ ν΄λμ€μ `supportedInterfaceOrientations` νλ‘νΌν°λ₯Ό νμ©νλ λ°©λ²μΌλ‘ κ΅¬ν


1. μ± λλ¦¬κ²μ΄νΈλ₯Ό μ΄μ©νλ λ°©λ²
    - νλ©΄ νμ μ μν΄μ `AppDelegate`μμ μλμ²λΌ `supportedInterfaceOrientation: bool` κ°μ μ€μ ν΄μ, trueμΌ κ²½μ° λͺ¨λ  νμ μ΄ κ°λ₯, falseμΌ κ²½μ° μΈλ‘λ§ κ°λ₯νλλ‘ μ€μ 

``` swift
var shouldSupportAllOrientation = true

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if supportedInterfaceOrientations {
        return .all
    }
    
    return .portrait
}
```
 - κ·Έλ¦¬κ³  κ° λ·°μ»¨νΈλ‘€λ¬μμ μ±λλ¦¬κ²μ΄νΈλ₯Ό μ€μ  λ° λ·° λΌμ΄νμ¬μ΄ν΄μμ `appDelegate.shouldSupportAllOrientation` λ³μλ₯Ό true, false νλ λ°©λ²μΌλ‘ λ©μΈνλ©΄μ μΈλ‘λ°©ν₯ κ³ μ , λ€λ₯Έ λ·°λ€μ λͺ¨λ λ°©ν₯μ΄ κ°λ₯νλλ‘ μ€μ 


```swift
private var appDelegate = UIApplication.shared.delegate as! AppDelegate

override func viewWillAppear(_ animated: Bool) {
Β  Β  appDelegate.shouldSupportAllOrientation = trueλλ false
}

```
- νμ§λ§ μ΄λ° λ°©λ²μ λͺ¨λ  λ·° μ»¨νΈλ‘€λ¬μμ μ±λλ¦¬κ²μ΄νΈμ λΌμ΄νμ¬μ΄ν΄μ μ€μ ν΄μ£Όμ΄μΌ νλ€λ μ΄μκ° μμ. κ·Έλμ 2λ²μ§Έ λ€λΉκ²μ΄μ μ»¨νΈλ‘€λ¬λ₯Ό μ΄μ©νλ λ°©λ²μ μ¬μ©νμ¬ κ΅¬ν

2. λ€λΉκ²μ΄μ μ»¨νΈλ‘€λ¬λ₯Ό μ΄μ©νλ λ°©λ²
    - νλ©΄ νμ μ μν΄μ `var supportedInterfaceOrientations: UIInterfaceOrientationMask` λ³μλ₯Ό μ€λ²λΌμ΄λ©νμ¬ νλ©΄ νμ  μ€μ 
    - λ€λΉκ²μ΄μ μ»¨νΈλ‘€λ¬κ° νμ λ·°λ₯Ό μλμ κ°μ λ°©λ²μΌλ‘ λ©μΈλ·°λ μΈλ‘λ§, λλ¨Έμ§λ λͺ¨λ λ°©ν₯μ΄ κ°λ₯νλλ‘ μ€μ 

```swift
class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController as? MainViewController != nil ? .portrait : .all
    }
}
```

3. μ€ννλ©΄

| ![Oct-27-2022_10-29-13](https://user-images.githubusercontent.com/49301866/198180870-d84c0f63-925e-478e-83b9-68e737f52348.gif) |
| :----------------------------------: |



### μΆνμ λͺ©λ‘κ³Ό μμΈ λ νλ©΄ λͺ¨λ κ°λ‘λ‘ νμ νμ λλ μ μμ μΌλ‘ νμλ  μ μλλ‘ κ΅¬ν

κΈ°λ³Ένμ μμ μ΄λ―Έμ§λ·°μ ν¬κΈ°λ₯Ό μ‘°μ ν  μ μμ΄ autolayoutμ μ€μ ν΄μ£ΌκΈ° μ΄λ €μ μ. κ·Έλμ `ItemCell`μ΄λΌλ custom μμ νμ©ν΄ autolayoutμ μ€μ 

- κΈ°λ³Ένμμκ³Ό customμ νλ©΄ λΉκ΅


| κΈ°λ³Ένμ(subtitle) μ   |  custom μ        |
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/ERzX7D4.jpg)| ![](https://i.imgur.com/EvAQr2w.png)


- κ³μΈ΅κ΅¬μ‘°

imageViewμ Labelλ€μ stackViewλ‘ μ€μ νμ¬ κ°λ‘,μΈλ‘λ‘ λ³΄μ¬μ§λ λμ imageView νΉμ Labelλ¬Άμμ ν¬κΈ°λ³νμ λͺ¨λ λ°μνλ cellμ κ΅¬ν
|    ||
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/JXdq3gU.png) | ![](https://i.imgur.com/ttKMjSK.png) |



### λͺ¨λ  νλ©΄μ Dynamic Typeμ μ μ©
1. UIκ°μ²΄ Dynamic Type μ€μ 
    - UIκ°μ²΄λ€ Dynamic Type μ μ©νμμ΅λλ€. μ€ν λ¦¬λ³΄λμ μλ UIκ°μ²΄λ μλμ κ°μ΄ μΈμ€νν° μ°½μμ Dynamic Type μ²΄ν¬ μ€μ 
![](https://i.imgur.com/P5s29vy.png)
    - μ½λλ‘ μμ±ν UIκ°μ²΄λ `adjustsFontForContentSizeCategory`νλ‘νΌν°λ₯Ό `true`λ‘ μ€μ 

2. Labelμ΄ μλ UIκ°μ²΄ `numberOfLines`νλ‘νΌν° 0μΌλ‘ μ€μ 
    - κΈμ¨κ° μ»€μ§λ κ²½μ° λ μ΄λΈ νμ€νΈκ° μ¬λ¬μ€λ‘ ννλ  μ μλλ‘ `numberOfLines`λ₯Ό 0μΌλ‘ μ€μ 

3. Label `lineBreak` μ€μ 
    - νμ€νΈκ° νλ©΄μ λμ΄κ° μ§€λ¦¬λ κ²½μ° ...μΌλ‘ ννλλ κ²μ λ°©μ§νκΈ° μν΄ `lineBreak`μ `TrunkCase`μμ `Word Wrap` λλ `Character Wrap` μΌλ‘ μ€μ 
    - νμ¬λ λ¬Έμλ¨μλ‘ μ§€λ¦¬λ `Character Wrap`μΌλ‘ μ€μ . λ¨μ΄λ¨μλ‘ μ§€λ €μΌ νλκ² μ’ λ κ°λμ±μ΄ μ’μ κ²½μ°λ `Word Wrap`μ μ¬μ©ν  μμ 

4. μ€ννλ©΄
![](https://i.imgur.com/rI6fhk1.gif)


## β° νμλΌμΈ


<details>
<summary>Step1 νμλΌμΈ</summary>
<div markdown="1">       
    
- 221018: jsonν¬λ§·μ λ°μ΄ν°μ λ§€μΉ­ν  νμ κ΅¬ν
- 221019: Decode UnitTest μΆκ° λ° Assets import
    
</div>
</details>

<details>
<summary>Step2 νμλΌμΈ</summary>
<div markdown="1"> 
    
- 221019: λ©μΈ λ·° κ΅¬ν
    - scrollView λ΄λΆμ stackViewκ΅¬ν
- 221019: stackViewλ΄λΆμ μ½λλ₯Ό ν΅ν΄ UI μΆκ°
    - UILabel
    - UIImageView
    - UIButton 
- 221021: koreanItems λ·° κ΅¬ν
    - tableView λ°μ΄ν° μ°λ
- 221021: segueλ₯Ό ν΅ν΄ λ©μΈ -> koreanItems λ·°λ‘ νλ©΄μ ν κ΅¬ν
- 221021: itemDetail μ€ν λ¦¬λ³΄λ μΆκ°
    - itemDetail λ·° κ΅¬ν Autolayout μ μ½ μΆκ°
    - VC μΈμ€ν΄μ€ μμ±μ ν΅ν νλ©΄μ ν
- 221025: Expositionλͺ¨λΈμ κ°κ³΅λ νλ‘νΌν° extensionμΌλ‘ λΆλ¦¬
- 221025: jsonDecoder, numberFormatter namespaceν
- 221025: decode() λ©μλ μ λ€λ¦­μ νμ©ν΄ ν΅μΌ
    
    
</div>
</details>

<details>
<summary>Step3 νμλΌμΈ</summary>
<div markdown="1">       
    
- 221026: μ»€μ€ν μ itemCell μΆκ°
- 221026: autolayout μ€μ 
- 221026: NavigationController ν΄λμ€ μΆκ°
    - λ·°λ³λ‘ orientation μ€μ 
- 221026: λͺ¨λ  νλ©΄μ DynamicType μ μ©
    
</div>
</details>


## π± μ€ν νλ©΄
| λ€λΉκ²μ΄μ μ΄λ   |  κ°λ‘ / μΈλ‘ λͺ¨λ        | λ€μ΄λλ―Ή νμ   | 
| :------------------: | :--------------: | :--------------:  |
| ![](https://i.imgur.com/IA0sjhx.gif) | ![αα‘αα©αα©αα³ αα¦αα³αα³](https://user-images.githubusercontent.com/73284068/198534965-dd10dc16-1aa1-429d-a65a-677417cafaba.gif) |    ![αα‘αα΅αα‘αα΅α¨αα‘αα΅αΈ αα¦αα³αα³](https://user-images.githubusercontent.com/73284068/198534983-3b28e844-0f04-4bf6-b2af-d9934d07726a.gif)
 


## β νΈλ¬λΈ μν & μ΄λ €μ λ μ 

 
### ν΄λ‘μ λ₯Ό μ¬μ©ν΄μ μμ±μ νλ²μ μ μν μ§, κ°μ²΄λ₯Ό μμ±ν ν μμ±μ μ€μ νλκ² μ’μμ§ κ³ λ―Ό
> ### π‘ νΈλ¬λΈμν
> μμ£Ό λ°λμ§ μμ νλ μμ±μΌ κ²½μ°(ν°νΈμ ν°νΈ μ¬μ΄μ¦ λ±) ν΄λ‘μ λ₯Ό μ¬μ©νμ¬ κ°μ²΄λ₯Ό μμ±νκ³ , λ μ΄λΈμ²λΌ λμ€μ λ³κ²½λ  κ²½μ°κ° μλ μμ±μΌ κ²½μ° ν΄λ‘μ  λ°μμ μ€μ .

```swift
let label: UILable = {
    let label = UILable()
    label.font = UIFont.preferredFont(forTextStyle: textStyle)
    
    return label
}()

label.text = text
```
### νλ©΄μ ν κ³Όμ μμμ Optional Binding μ²λ¦¬μ κ΄ν μλ¬Έ
VCκ°μ²΄λ₯Ό μμ±ν΄μ νλ©΄μ νμ ν  λ λ³΄ν΅ optional bindingμ ν΄μ£ΌλΌκ³  νλλ°, μ€ν λ¦¬λ³΄λμμ λ·°μ»¨νΈλ‘€λ¬λ₯Ό μ°λ €κ³  νλ©΄ μ μ΅μλμ μ²λ¦¬ν΄μ£Όμ§ μμλ λλκ±΄μ§ κΆκΈνλ€. `instantiateViewController()`λ©μλμ κΈ°λ₯μ identifierμ ν΄λΉνλ λ·°μ»¨νΈλ‘€λ¬λ₯Ό μ°Ύμ μμ±νλ€. ν΄λΉ identifierλ₯Ό κ°μ§ λ·°μ»¨νΈλ‘€λ¬κ° μ‘΄μ¬νμ§ μμ κ°λ₯μ±λ μκΈ° λλ¬Έμ μ΅μλνμμ΄κ³  μ΄λ₯Ό bindingν΄μ€λ€κ³  μκ°νλ€.
κ·ΈλΌ 2λ²μ§Έ caseμ²λΌ UIStoryboardλ₯Ό ν΅ν΄ μΈμ€ν΄μ€λ₯Ό μμ±ν΄μ€ λ, κ·Έ μμ μνλ μ»¨νΈλ‘€λ¬λ₯Ό μ°Ύμ λμλ 1λ²μ§Έ caseμ λ§μ°¬κ°μ§λ‘ μ΅μλ μ²λ¦¬λ₯Ό ν΄μ£Όμ΄μΌνμ§ μμκΉ??

```swift
// κ°μ μ€ν λ¦¬λ³΄λ λ΄μμ VCλ₯Ό μμ±ν΄μ€ λ,
// itemDetailViewControllerλ₯Ό μ΅μλ λ°μΈλ©μ²λ¦¬ν΄μ€μΌ ν¨
guard let itemDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewControllerID") else {
    return 
}
self.navigationController?.pushViewController(itemDetailViewController, animated: true)
```

```swift
// λ€λ₯Έ μ€ν λ¦¬λ³΄λ λ΄μμ VCλ₯Ό μμ±ν΄μ€ λ,
// storyboard, itemDetailViewControllerκ° μ΅μλ νμμ΄ μλ
// λΉλλ λ¬Έμ μμ΄ λμ§λ§, identifierλ₯Ό μλͺ» μλ ₯ν  κ²½μ° runtime μ€λ₯ λ°μ
let storyboard = UIStoryboard(name: "ItemDetail", bundle: Bundle.main)
let itemDetailViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewControllerID")
self.navigationController?.pushViewController(itemDetailViewController, animated: true)
```
> ### π‘ νΈλ¬λΈμν
> κ³΅μλ¬Έμλ₯Ό μ΄ν΄λ³΄λ©΄ `instantiateViewController()`μ λ¦¬ν΄νμμ `μ΅μλμ΄ μλλ€`. κ·Έ λ§μ μ΅μλ λ°μΈλ©μ ν΄μ£Όλ μ΄μ κ° `instantiateViewController()`λλ¬Έμ μλλΌλ λ§.
>
> μμ caseμμ λ³΄μ¬μ§λ μ°¨μ΄μ μ storyboardκ° μ΅μλμΈμ§ μλμ§μ μ°¨μ΄ λΏμ΄λ€. κ²°κ΅­ storyboardκ° nilμ΄λΌλ©΄, νμ λ©μλμΈ `instantiateViewController()` λν nilμ΄ λκΈ° λλ¬Έμ κ²°κ΅­ μ΅μλ λ°μΈλ©μ ν΄μ£Όλ μ΄μ λ storyboardκ° nilμΌ κ°λ₯μ±μ΄ μκΈ° λλ¬Έμ΄λ€.


### μ€ν λ μ΄μμ constraint μ€λ₯ λ°μ
νμ΄λΈλ·° νλ©΄μμλ§ μΈλ‘λͺ¨λμμ κ°λ‘λͺ¨λλ‘ λ³κ²½ν  λ μ½μμ°½μ κΈ΄ λ©μΈμ§κ° μΆλ ₯ μλ?¬λ μ΄ν°κ° λ©μΆκ±°λ λ°νμμ€λ₯κ° λ°μνλ κ±΄ μλμ§λ§ μλ¬λ©μΈμ§λ‘ λ³΄μ¬μ§.
![](https://i.imgur.com/ARg2ogz.gif)

> ### π‘ νΈλ¬λΈμν
> μ€λ₯ λ©μΈμ§μ NSLayoutConstraint μ λ³΅λΆν΄μ [WTF Autolayout](https://www.wtfautolayout.com/) μ λ£μ΄λ³΄κ³  μ΄λ€ μ€λ₯μΈμ§ νμνκΈ°
> ![](https://i.imgur.com/2GBFfKq.png)





### tableCellμ μ νν΄ μμΈνμ΄μ§λ‘ μ΄λ ν, λ€μ tableViewλ‘ λμμμ λ μ¬μ ν νμμΌλ‘ μ νλμ΄μλ λ¬Έμ 
> ### π‘ νΈλ¬λΈμν
> UITableViewDelegateμμ μμΈνμ΄μ§λ‘ λμ΄κ° λ ν΄λΉ indexPathμ `deselectRow()`λ©μλλ₯Ό νΈμΆ

| deselect μ    |    deselect ν      |
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/VzprqjZ.gif)| ![](https://i.imgur.com/lUtAV0Z.gif)

---

## π μ°Έκ³  λ§ν¬

[UITableView](https://developer.apple.com/documentation/uikit/uitableview) <br>
[Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views) <br>
[Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data) <br>
[Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table) <br>
[JSON](https://ko.wikipedia.org/wiki/JSON) <br>
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
<br> - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
<br> - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
[LLDB μ λ³΅νκΈ°](https://yagom.net/courses/start-lldb/) <br>
[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html) <br>
[Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) <br>
[Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) <br>
[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter) <br>

[π λ§¨ μλ‘ μ΄λνκΈ°](#-λ§κ΅­λ°λν-)
