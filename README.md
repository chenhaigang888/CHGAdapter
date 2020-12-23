<a href="https://img.shields.io/cocoapods/v/CHGAdapter.svg"><img src="https://img.shields.io/cocoapods/v/CHGAdapter.svg"></a>
<a href="http://cocoadocs.org/docsets/CHGAdapter"><img src="https://img.shields.io/cocoapods/p/CHGAdapter.svg?style=flat"></a>

# CHGAdapter 
主要解决UITableView 在每个controller中都需要设置dataSource和delegate的烦恼，并UITableViewCell与DataSource tableView解耦合
具体表现为

- Adapter与UITableView、Adapter与UITableViewCell完全解耦合。
- 只需要在controller中设置好adapter，给adapter需要显示的数据，adapter会把每个cell需要的数据赋予cell。
- UITableViewCell中按钮的点击事件、UITextField的输入事件、UISwitch等等都通过统一的CHGTableViewDidSelectRowBlock进行传输。
- controller少了很多有关UITableViewDelegate以及UITableViewDatasource的相关代码，controller代码更加清晰。
- 基于以上特点adapter、cell、HeaderFooterView都可以最大限度的复用
### Android(CHGAdapter)
- Java:https://github.com/chenhaigang888/CHGAdapter_android 
- Kotlin:https://github.com/chenhaigang888/CHGAdapter_Kotlin

### Ios(CHGAdapter)
- oc:https://github.com/chenhaigang888/CHGAdapter 
- swift:https://github.com/chenhaigang888/CHGAdapter_swift

### HarmonyOS(UltimateProvider)
- java:https://github.com/chenhaigang888/UltimateProvider

### 如有使用方面的问题或者交流请加QQ群：494648687

### Installation with CocoaPods

> pod 'CHGAdapter', '~> 1.1.4'
- 导入头文件 #import "CHGAdapter.h"

### example （UITableView）
以下Demo为swift代码所写，但是和OC版本没有任何区别

- 1.显示cell

```
import UIKit

/// 展示TableView中只有cell的用法
class Base1ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "歌曲"
        tableView.cellDatas = [getSongs()!]
    }

    func getSongs() -> [Any]? {
        var songs = [Any]()
        for item in ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"] {
            songs.append(SongsModel(name: item))
        }
        return songs
        
    }
}

```

- 2.显示header和footer

```
import UIKit

/// 展示TableView中存在headerFooterView和cell的用法
class Base2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "展示TableView中存在headerFooterView和cell的用法"
        tableView.headerDatas = getHeaderModels()
        tableView.cellDatas = [getSongs1(),getSongs2()]
        tableView.footerDatas = getFooterModels()
    }
    
    ///专辑1数据
    func getSongs1() -> [Any] {
        var songs = [Any]()
        for item in ["半兽人","半岛铁盒","暗号","龙拳","火车叨位去","分裂（离开）","爷爷泡的茶","回到过去","米兰的小铁匠","最后的战役"] {
            songs.append(SongsModel(name: item))
        }
        return songs
    }
    
    ///专辑2数据
    func getSongs2() -> [Any] {
        var songs = [Any]()
        for item in ["爱在西元前","爸我回来了","简单爱","忍者","开不了口","上海一九四三","对不起","威廉古堡","双截棍","安静"] {
            songs.append(SongsModel(name: item))
        }
        return songs
    }
    
    ///headerView数据
    func getHeaderModels() -> [Any]? {
        return [Album.init(name: "八度空间", createTime: "2002年7月18日"),
                Album.init(name: "范特西", createTime: "2001年9月20日")]
    }
    
    ///footerView数据
    func getFooterModels() -> [Any]? {
        return [AlbumDesc.init(desc: "《八度空间》这张专辑的创作灵感来自周杰伦平时看的一些电影和音乐录影带。"),
                AlbumDesc.init(desc: "《范特西》的专辑名称来源是英文“Fantasy”的发音，意为范特西范特西(3张)“幻想” 。")]
    }

}

```

- 3.cell点击处理

```
import UIKit

class Base3ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础3（cell点击处理）"
        tableView.cellDatas = [getSongs()]
        
        tableView.setTableViewDidSelectRowBlock { (tableView, indexPath, itemData) in
            guard let model:SongsModel = itemData as? SongsModel else { return }
            print("当前点击：\(model.name!)")
        }
    }

    func getSongs() -> [Any] {
        var songs = [Any]()
        for item in ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"] {
            songs.append(SongsModel(name: item))
        }
        return songs
        
    }
}


```

- 4.cell、headerFooterView中的事件传递到ViewController中

```
import UIKit

class Base4ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础4（cell、headerFooterView中的事件传递到ViewController中）"
        tableView.headerDatas = [createOrderGroup()]
        tableView.cellDatas = [createOrders()]
        tableView.setEventTransmissionBlock(eventTransmissionBlock: handleEventTransmissionBlock())
        tableView.setEmptyDataShow("无数据", imageName: "")
    }
  
    func createOrders() -> [Order] {
        var orders = [Order]()
        for i in 0...10 {
            orders.append(Order.init(id: i, orderNO: "\(i)", createTime: "2020-7-6", amount: "\(100+i)"))
        }
        return orders
        
    }
    
    func createOrderGroup() -> OrderGroup {
        return OrderGroup.init(desc: "2020年6月", btnText: "全部删除")
    }
    
    func handleEventTransmissionBlock() -> CHGEventTransmissionBlock {
        return { [weak self](target, params, tag, callBack) -> Any? in
            if target is OrderTableViewCell {//cell中的事件
                switch OrderAction.init(rawValue: tag) {
                case .refund:
                    return self?.refund(with: target, params: params, tag: tag, callBack: callBack)
                case .conform:
                    return self?.conform(with: target, params: params, tag: tag, callBack: callBack)
                default:
                    break
                }
            } else if target is OrderGroupHeaderFooterView {//header中的事件
                if tag == 0 {
                    return self?.deleteAllOrders(with: target, params: params, tag: tag, callBack: callBack)
                }
            }
            return nil
        }
    }
    
    func refund(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        guard let model:Order = params as? Order else { return nil }
        print("处理退货操作  订单id:\(model.id)   订单号：\(model.orderNO)   订单金额：\(model.amount)   创建时间：\(model.createTime)")
        return nil;
    }
    
    func conform(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        guard let model:Order = params as? Order else { return nil }
        print("处理确认收货操作  订单id:\(model.id)   订单号：\(model.orderNO)   订单金额：\(model.amount)   创建时间：\(model.createTime)")
        _ = callBack?(true)//告诉cell中处理完成
        return nil;
    }
    
    func deleteAllOrders(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        tableView.headerDatas = []
        tableView.cellDatas = []
        tableView.reloadData()
        return nil;
    }

}

```

- 5.多种Model在cell中

```
import UIKit

class Base5ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础5（多种Model在cell中）"
        tableView.cellDatas = [createData()]
    }


    func createData() -> [Any] {
        var data = [Any]()
        for i in 0...100 {
            if i % 2 == 0 {
                data.append(Products.init(name: "产品：\(i)", price: "价格：\(i)", image: "pc", desc: "描述\(i)"))
            } else {
                data.append(SongsModel.init(name: "音乐\(i)", cover: ""))
            }
        }
        return data
        
    }

}

```

- 6_1.cell和headerFooter为同一个Model

```
import UIKit

class Base6ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础5-1（cell和headerFooter为同一个Model）"
        
        tableView.headerDatas = createData()
        tableView.cellDatas = createData()
        tableView.footerDatas = createData()
        tableView.tableViewAdapter?.keyPathOfSubData = \ProductsType.productses
    }


    func createData() -> [Any] {
        var productTypes = [ProductsType]()
        let types = ["电脑","手机","耳机"]
        let pcs = ["联想","华为","惠普","戴尔","神舟","苹果"]
        
        for i in 0..<3 {
            var productses = [Products]()
            for item in pcs {
                productses.append(Products.init(name: "\(item)\(types[i])", price: "4999", image: "pc", desc: ""))
            }
            productTypes.append(ProductsType.init(name: types[i], productses: productses, desc: "这是\(types[i])类型商品的描述内容!"))
        }
        
        return productTypes
    }
}

```

- 6_2.多种cell和headerFooter为同一个Model

```
import UIKit

class Base6_2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础6-2（多种cell和headerFooter为同一个Model）"
        var data = [Any]()
        data.append(contentsOf: createProducts())
        data.append(contentsOf: createSinger())
        
        tableView.headerDatas = data
        tableView.cellDatas = data
        tableView.footerDatas = data
    }

    func createProducts() -> [Any] {
        var productTypes = [ProductsType]()
        let types = ["电脑","手机","耳机"]
        let pcs = ["联想","华为","惠普","戴尔","神舟","苹果"]
        
        for i in 0..<3 {
            var productses = [Products]()
            for item in pcs {
                productses.append(Products.init(name: "\(item)\(types[i])", price: "4999", image: "pc", desc: ""))
            }
            productTypes.append(ProductsType.init(name: types[i], productses: productses, desc: "这是\(types[i])类型商品的描述内容!"))
        }
        
        return productTypes
    }
    
    func createSinger() -> [Singer] {
        var singers = [Singer]()
        let types = ["周杰伦","林俊杰","王力宏"]
        let jaySongs = ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"]
        let linJunJieSongs = ["江南","一千年以后","曹操","醉赤壁","100天","她说","学不会","修炼爱情","可惜没如果","不为谁而作的歌"]
        let wangLiHongSongs = ["公转自转","唯一","你不在","心中的日月","盖世英雄","我们的歌","心跳","需要人陪","缘分一道桥"]
        
        for i in 0..<3 {
            var songs = [SongsModel]()
            if i == 0 {
                for song in jaySongs {
                    songs.append(SongsModel.init(name: song, cover: ""))
                }
            } else if i == 1 {
                for song in linJunJieSongs {
                    songs.append(SongsModel.init(name: song, cover: ""))
                }
            } else if i == 2 {
               for song in wangLiHongSongs {
                   songs.append(SongsModel.init(name: song, cover: ""))
               }
            }
            singers.append(Singer.init(name: types[i], songs: songs,desc: "这是歌手'\(types[i])'的简介"))
        }
        return singers
    }
}

```

### example （UICollectionView）用法和UICollectionView完全一样

- 1.显示cell

```
import UIKit

class Base1ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "歌曲"
        collectionView.cellDatas = [getSongs()!]
    }

    func getSongs() -> [Any]? {
        var songs = [Any]()
        for item in ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"] {
            songs.append(SongsModel(name: item))
        }
        return songs
        
    }
}

```

- 2.显示header和footer

```
import UIKit

/// 展示collectionView中存在headerFooterView和cell的用法
class Base2ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "展示collectionView中存在headerFooterView和cell的用法"
        collectionView.headerDatas = getHeaderModels()
        collectionView.cellDatas = [getSongs1(),getSongs2()]
        collectionView.footerDatas = getFooterModels()
    }
    
    ///专辑1数据
    func getSongs1() -> [Any] {
        var songs = [Any]()
        for item in ["半兽人","半岛铁盒","暗号","龙拳","火车叨位去","分裂（离开）","爷爷泡的茶","回到过去","米兰的小铁匠","最后的战役"] {
            songs.append(SongsModel(name: item))
        }
        return songs
    }
    
    ///专辑2数据
    func getSongs2() -> [Any] {
        var songs = [Any]()
        for item in ["爱在西元前","爸我回来了","简单爱","忍者","开不了口","上海一九四三","对不起","威廉古堡","双截棍","安静"] {
            songs.append(SongsModel(name: item))
        }
        return songs
    }
    
    ///headerView数据
    func getHeaderModels() -> [Any]? {
        return [Album.init(name: "八度空间", createTime: "2002年7月18日"),
                Album.init(name: "范特西", createTime: "2001年9月20日")]
    }
    
    ///footerView数据
    func getFooterModels() -> [Any]? {
        return [AlbumDesc.init(desc: "《八度空间》这张专辑的创作灵感来自周杰伦平时看的一些电影和音乐录影带。"),
                AlbumDesc.init(desc: "《范特西》的专辑名称来源是英文“Fantasy”的发音，意为范特西范特西(3张)“幻想” 。")]
    }

}

```

- 3.cell点击处理

```
import UIKit

class Base3ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础3（cell点击处理）"
        collectionView.cellDatas = [getSongs()]
        
        collectionView.setcollectionViewDidSelectRowBlock { (collectionView, indexPath, itemData) in
            guard let model:SongsModel = itemData as? SongsModel else { return }
            print("当前点击：\(model.name!)")
        }
    }

    func getSongs() -> [Any] {
        var songs = [Any]()
        for item in ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"] {
            songs.append(SongsModel(name: item))
        }
        return songs
        
    }
}


```

- 4.cell、headerFooterView中的事件传递到ViewController中

```
import UIKit

class Base4ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础4（cell、headerFooterView中的事件传递到ViewController中）"
        collectionView.headerDatas = [createOrderGroup()]
        collectionView.cellDatas = [createOrders()]
        collectionView.setEventTransmissionBlock(eventTransmissionBlock: handleEventTransmissionBlock())
        collectionView.setEmptyDataShow("无数据", imageName: "")
    }
  
    func createOrders() -> [Order] {
        var orders = [Order]()
        for i in 0...10 {
            orders.append(Order.init(id: i, orderNO: "\(i)", createTime: "2020-7-6", amount: "\(100+i)"))
        }
        return orders
        
    }
    
    func createOrderGroup() -> OrderGroup {
        return OrderGroup.init(desc: "2020年6月", btnText: "全部删除")
    }
    
    func handleEventTransmissionBlock() -> CHGEventTransmissionBlock {
        return { [weak self](target, params, tag, callBack) -> Any? in
            if target is OrdercollectionViewCell {//cell中的事件
                switch OrderAction.init(rawValue: tag) {
                case .refund:
                    return self?.refund(with: target, params: params, tag: tag, callBack: callBack)
                case .conform:
                    return self?.conform(with: target, params: params, tag: tag, callBack: callBack)
                default:
                    break
                }
            } else if target is OrderGroupHeaderFooterView {//header中的事件
                if tag == 0 {
                    return self?.deleteAllOrders(with: target, params: params, tag: tag, callBack: callBack)
                }
            }
            return nil
        }
    }
    
    func refund(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        guard let model:Order = params as? Order else { return nil }
        print("处理退货操作  订单id:\(model.id)   订单号：\(model.orderNO)   订单金额：\(model.amount)   创建时间：\(model.createTime)")
        return nil;
    }
    
    func conform(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        guard let model:Order = params as? Order else { return nil }
        print("处理确认收货操作  订单id:\(model.id)   订单号：\(model.orderNO)   订单金额：\(model.amount)   创建时间：\(model.createTime)")
        _ = callBack?(true)//告诉cell中处理完成
        return nil;
    }
    
    func deleteAllOrders(with target:Any?, params:Any?, tag:Int, callBack:CHGCallBack?) -> Any? {
        collectionView.headerDatas = []
        collectionView.cellDatas = []
        collectionView.reloadData()
        return nil;
    }

}

```

- 5.多种Model在cell中

```
import UIKit

class Base5ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础5（多种Model在cell中）"
        collectionView.cellDatas = [createData()]
    }


    func createData() -> [Any] {
        var data = [Any]()
        for i in 0...100 {
            if i % 2 == 0 {
                data.append(Products.init(name: "产品：\(i)", price: "价格：\(i)", image: "pc", desc: "描述\(i)"))
            } else {
                data.append(SongsModel.init(name: "音乐\(i)", cover: ""))
            }
        }
        return data
        
    }

}

```

- 6_1.cell和headerFooter为同一个Model

```
import UIKit

class Base6ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础5-1（cell和headerFooter为同一个Model）"
        
        collectionView.headerDatas = createData()
        collectionView.cellDatas = createData()
        collectionView.footerDatas = createData()
        collectionView.collectionViewAdapter?.keyPathOfSubData = \ProductsType.productses
    }


    func createData() -> [Any] {
        var productTypes = [ProductsType]()
        let types = ["电脑","手机","耳机"]
        let pcs = ["联想","华为","惠普","戴尔","神舟","苹果"]
        
        for i in 0..<3 {
            var productses = [Products]()
            for item in pcs {
                productses.append(Products.init(name: "\(item)\(types[i])", price: "4999", image: "pc", desc: ""))
            }
            productTypes.append(ProductsType.init(name: types[i], productses: productses, desc: "这是\(types[i])类型商品的描述内容!"))
        }
        
        return productTypes
    }
}

```

- 6_2.多种cell和headerFooter为同一个Model

```
import UIKit

class Base6_2ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础6-2（多种cell和headerFooter为同一个Model）"
        var data = [Any]()
        data.append(contentsOf: createProducts())
        data.append(contentsOf: createSinger())
        
        collectionView.headerDatas = data
        collectionView.cellDatas = data
        collectionView.footerDatas = data
    }

    func createProducts() -> [Any] {
        var productTypes = [ProductsType]()
        let types = ["电脑","手机","耳机"]
        let pcs = ["联想","华为","惠普","戴尔","神舟","苹果"]
        
        for i in 0..<3 {
            var productses = [Products]()
            for item in pcs {
                productses.append(Products.init(name: "\(item)\(types[i])", price: "4999", image: "pc", desc: ""))
            }
            productTypes.append(ProductsType.init(name: types[i], productses: productses, desc: "这是\(types[i])类型商品的描述内容!"))
        }
        
        return productTypes
    }
    
    func createSinger() -> [Singer] {
        var singers = [Singer]()
        let types = ["周杰伦","林俊杰","王力宏"]
        let jaySongs = ["七里香","青花瓷","简单爱","双截棍","夜曲","以父之名","稻香","可爱女人","红尘客栈","床边故事","跨时代"]
        let linJunJieSongs = ["江南","一千年以后","曹操","醉赤壁","100天","她说","学不会","修炼爱情","可惜没如果","不为谁而作的歌"]
        let wangLiHongSongs = ["公转自转","唯一","你不在","心中的日月","盖世英雄","我们的歌","心跳","需要人陪","缘分一道桥"]
        
        for i in 0..<3 {
            var songs = [SongsModel]()
            if i == 0 {
                for song in jaySongs {
                    songs.append(SongsModel.init(name: song, cover: ""))
                }
            } else if i == 1 {
                for song in linJunJieSongs {
                    songs.append(SongsModel.init(name: song, cover: ""))
                }
            } else if i == 2 {
               for song in wangLiHongSongs {
                   songs.append(SongsModel.init(name: song, cover: ""))
               }
            }
            singers.append(Singer.init(name: types[i], songs: songs,desc: "这是歌手'\(types[i])'的简介"))
        }
        return singers
    }
}

```
