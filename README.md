# ☁ 날씨앱

## 🪧 목차
- [📜 프로젝트 소개](#-프로젝트-소개)
- [📱 실행 화면](#-실행-화면)
- [💡 핵심경험](#-핵심경험)
- [🗂 폴더 구조](#-폴더-구조)
- [🧑‍💻 코드 설명](#-코드-설명)
- [⚡️ 트러블 슈팅](#-트러블-슈팅)

<br>

## 📜 프로젝트 소개
사용자 위치 및 시간을 기준으로 10일 사이 날씨를 알려주고 원하는 도시를 리스트에 추가하면
추가한 도시의 날씨도 알려주는 날씨앱 입니다.

> 프로젝트 기간: 1 Month</br>
> 팀원:  [백곰](https://github.com/Baek-Gom-95),[웨인](https://github.com/Web-Engine) </br>

<br>

## 🧑🏻‍💻🧑🏻‍💻 개발자 소개

|[백곰(iOS 담당)](https://github.com/Baek-Gom-95)|[웨인(Back-end 담당)](https://github.com/Web-Engine)|
|:---:|:---:|
|<img src = "https://i.imgur.com/c17eEk8.jpg" width="250" height="250"> | <img src = "https://imgur.com/drbqcqV.jpg" width="250" height="250"> |
	
<br>
	
## 📱 실행 화면
|Launch Screen | 기본화면 |
|:---:|:---:|
|<img src = "https://imgur.com/55cFOBD.png" width="250" height="550"> | <img src = "https://imgur.com/6uI9YO9.png" width="250" height="550"> |

|리스트 기본화면 | 도시추가 찾기화면 |
|:---:|:---:|
|<img src = "https://imgur.com/PzeKF28.png" width="250" height="550"> | <img src = "https://imgur.com/kO28IAE.png" width="250" height="550"> |

| 도시추가 입력화면 | 도시추가 도시클릭 화면 |
|:---:|:---:|
|<img src = "https://imgur.com/UrhPwfY.png" width="250" height="550"> | <img src = "https://imgur.com/Pj1quri.png" width="250" height="550"> |

| 도시추가 후 리스트 화면 | 도시추가 후 동일도시추가 시도화면 |
|:---:|:---:|
|<img src = "https://imgur.com/YsXPBhJ.png" width="250" height="550"> | <img src = "https://imgur.com/Pzvz7vi.png" width="250" height="550"> |

| 도시추가 후 기본화면 | 도시추가 후 기본화면 |
|:---:|:---:|
|<img src = "https://imgur.com/BtXKRK1.png" width="250" height="550"> | <img src = "https://imgur.com/5DUni8k.png" width="250" height="550"> |

| 도시삭제화면 | 도시삭제 후 기본화면 |
|:---:|:---:|
|<img src = "https://imgur.com/PU3UkH8.png" width="250" height="550"> | <img src = "https://imgur.com/uTrr9Yf.png" width="250" height="550"> |

| 도입부 및 시작화면 | 도시추가화면 |
|:---:|:---:|
|<img src = "https://imgur.com/MqQL8l2.gif" width="250" height="550"> | <img src = "https://imgur.com/bGQCkRG.gif" width="250" height="550"> |

| 도시추가 및 추가불가 확인 | 도시추가 후 날씨화면 |
|:---:|:---:|
|<img src = "https://imgur.com/LkMvMFE.gif" width="250" height="550"> | <img src = "https://imgur.com/HZUwUiC.gif" width="250" height="550"> |

| 도시추가 후 상세화면 | 도시삭제 후 재추가 |
|:---:|:---:|
|<img src = "https://imgur.com/Zwhbxwm.gif" width="250" height="550"> | <img src = "https://imgur.com/4MXRTZd.gif" width="250" height="550"> |

<br>

## 💡 핵심경험
- [x] UIPageViewController
- [x] UIPageControl
- [x] MKLocalSearch
- [x] UISearchBar
- [x] CAGradientLayer
- [x] UIVisualEffectView
- [x] CoreLocation
- [x] Singleton
- [x] Date Formatter
- [x] CoreData
- [x] CoreData Model
- [x] TableView Swipe
- [x] REST API

<br>


## 🗂 폴더 구조

```
.
DalKommWeather
├── API
│   ├── DailyWeatherAPI.swift
│   ├── HourlyWeatherAPI.swift
│   └── UserLoactionAPI.swift
├── AppDelegate.swift
├── Assets.xcassets
│   ├── AccentColor.colorset
│   │   └── Contents.json
│   ├── AppIcon.appiconset
│   │   ├── 100.png
│   │   ├── 1024.png
│   │   ├── 114.png
│   │   ├── 120.png
│   │   ├── 144.png
│   │   ├── 152.png
│   │   ├── 167.png
│   │   ├── 180.png
│   │   ├── 20.png
│   │   ├── 29.png
│   │   ├── 40.png
│   │   ├── 50.png
│   │   ├── 57.png
│   │   ├── 58.png
│   │   ├── 60.png
│   │   ├── 72.png
│   │   ├── 76.png
│   │   ├── 80.png
│   │   ├── 87.png
│   │   └── Contents.json
│   ├── Contents.json
│   ├── cloud.imageset
│   │   ├── Contents.json
│   │   └── cloud.png
│   ├── karamelpopcorn-weather-intro.imageset
│   │   ├── Contents.json
│   │   ├── karamelpopcorn-weather-intro.png
│   │   ├── karamelpopcorn-weather-intro2.png
│   │   └── karamelpopcorn-weather-intro3.png
│   ├── night.imageset
│   │   ├── Contents.json
│   │   └── night.png
│   ├── nightcloud.imageset
│   │   ├── Contents.json
│   │   └── nightcloud.png
│   ├── raini.imageset
│   │   ├── Contents.json
│   │   └── raini.png
│   ├── snow.imageset
│   │   ├── Contents.json
│   │   └── snow.png
│   ├── snowcloud.imageset
│   │   ├── Contents.json
│   │   └── snowcloud.png
│   ├── suncloud.imageset
│   │   ├── Contents.json
│   │   └── suncloud.png
│   ├── sunny.imageset
│   │   ├── Contents.json
│   │   └── sunny.png
│   ├── thunder.imageset
│   │   ├── Contents.json
│   │   └── thunder.png
│   └── windy.imageset
│       ├── Contents.json
│       └── windy.png
├── Base.lproj
│   ├── LaunchScreen.storyboard
│   └── Main.storyboard
├── CoreData
│   └── WeatherListDataManager.swift
├── Enum
│   ├── CustomError.swift
│   ├── HexCodeEnum.swift
│   ├── ImageNameEnum.swift
│   ├── URLCollection.swift
│   └── WindDirection8.swift
├── Extension
│   ├── ButtonTouchSizeUP .swift
│   ├── CollectionViewCellID.swift
│   ├── DateManager.swift
│   ├── Extension+UICollectionView.swift
│   ├── LocationService.swift
│   ├── ReuseIdentifying.swift
│   ├── SetWeatherImage.swift
│   ├── SetWeatherState.swift
│   ├── UIColor.swift
│   └── UILabel+Extension.swift
├── Info.plist
├── IntroViewController.swift
├── Model
│   ├── CityInformation.swift
│   ├── DailyWeatherData.swift
│   ├── DailyWeatherDetailData.swift
│   ├── HourlyWeatherData.swift
│   ├── HourlyWeatherDetailData.swift
│   ├── ResponseCityDataFromLocation.swift
│   ├── ResponseData.swift
│   ├── TemperatureModel.swift
│   ├── WeatherListItem.swift
│   └── WeatherSaveModel.swift
├── Protocol
│   └── DataManage.swift
├── SceneDelegate.swift
├── Singleton
│   └── UserInfo.swift
├── View
│   ├── DailyWeatherView.swift
│   ├── HourlyWeatherCollectionViewCell.swift
│   ├── IntroView.swift
│   ├── IntroView.xib
│   ├── ListFooterView.swift
│   ├── MyCollectionView.swift
│   ├── SearchTableViewCell.swift
│   ├── WeatherListViewCell.swift
│   ├── WeatherView.swift
│   └── WeatherView.xib
├── ViewController
│   ├── File.swift
│   ├── PageViewController.swift
│   ├── SearchViewController.swift
│   ├── WeatherListViewController.swift
│   └── WeatherViewController.swift
└── WeatherListModel.xcdatamodeld
    └── WeatherListModel.xcdatamodel
        └── contents

```

<br>

## 🧑‍💻 코드 설명
- `DailyWeatherAPI `: 오늘날씨 정보를 가져오는 코드입니다.
- `HourlyWeatherAPI `: 시간별 날씨 정보를 가져오는 코드입니다
- `UserLoactionAPI `: 현재 사용자 위치를 정보로 도시이름과 도시넘버를 가져옵니다.
- `WeatherListDataManager `: CoreData의 CRUD 기능을 가진 코드입니다. 
- `UserInfo `: 싱글톤을 통해 관리해야하는 데이터를 정의합니다.
- `DailyWeatherView `: 일자별 날씨뷰 코드입니다.
- `WeatherView `: 사용자 위치기준 날씨뷰 코드입니다.
- `WeatherListViewCell `: 사용자 기준과 추가한 도시 날씨리스트 뷰셀 입니다.
- `SearchTableViewCell `: 검색바 테이블 뷰 셀입니다.
- `PageViewController `: 모든 날씨 뷰를 관리하는 컨틀롤러 입니다.
- `WeatherViewController `: 날씨뷰를 관리하는 컨트롤러 입니다.
- `WeatherListViewController `: 사용자기준 현재위치 및 추가한 도시 리스트를 관리하는 컨트롤러 입니다.
- `SearchViewController `: 서치바를 관리하는 컨트롤러 입니다.

<br><br>

## 🚀 트러블 슈팅

### UIPageViewController

#### 🚨 문제 배경
1개 이상의 도시의 날씨를 화면에 나타내는데 기존설계는 ViewController한개에 가로 스크롤으로 뷰객체를 
생성하여 하나씩 더해줄 생각이었으나 구현해보려하니 불가능하다는걸 알게되었습니다.

#### ⭐️ 해결방법
UIPageViewController를 통해 기존뷰를 띄웠던 ViewController를 객체화 시켜 UIPageViewController에 배열로
담아 구현

[UIPageViewController 참고링크](https://ios-development.tistory.com/623)

###  🤩 알게된점
UIPageViewController는 iOS에서 제공하는 컨테이너 뷰 컨트롤러의 한 종류이며. 이 컨트롤러는 여러 개의 뷰 컨트롤러를 페이지 형식으로 관리하고 표시하는 데 사용된다

---
    
### LaunchScreen 

#### 🚨 문제 배경
앱 시작시 바로 메인 화면이 나오는게아닌 런치스크린을 구현하고싶었습니다 뷰컨트롤러에서 화면을 잠시 보여준다음
그다음 뷰를 보여줄려고 설계를 하고 바탕화면 색상도 HexCode로 Enum으로 만들었지만 1초정도 화면에 띄우고 그다음 화면으로 안넘어가지는 문제발생 

#### ⭐️ 해결방법
LaunchScreen 을 사용하여 스플래시 이미지 사용 및 AppDelegate에 Sleep을 통해 LaunchScreen 화면
시간 조절 가능 확인 하여 해결하였습니다.

[LaunchScreen 참고링크](https://staktree.github.io/ios/IOS-splash-01/)

####  🤩 알게된점
시작화면을 잠시 보여줄시 LaunchScreen 이란것이 있으며 AppDelegate의 Sleep을 통해
화면 표시시간도 조절할수있다.
