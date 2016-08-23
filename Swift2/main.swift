//
//  main.swift
//  Swift2
//
//  Created by ataw on 16/8/16.
//  Copyright © 2016年 王宗成. All rights reserved.
//

import Foundation

print("Hello, World!")

//#MARK:- 字符串操作
print("我的名字"+"叫"+"MCI")
//字符变量 定义之后不能拼接

//字符计数：字符串里面的字符都是由字符标量 组成 多个标量可能组成一个字符
let name = "my name"

print(name.characters.count)//获取字符的长度

print("字符串\(name)的长度\(name.characters.count)")

//字符串 内插入 语法:\(表达式、常量、变量、字面量)
let insertName = "\(name)插入\(2.5)"
print(insertName)

let insertedName = "\(insertName) \("")"

let studen_score = ["banji":100,"ru":20]
print("\(studen_score["banji"])")

//字符串比较 :注意：由于字符串是里面的字符 由标量组成 判断是否相等的时候并不看结构是否一样 最后的到的字符串一致就算相等
let cas1 = "caf\u{E9}"

print(cas1)

let cas2 = "caf\u{65}\u{301}"
print(cas2)


if cas1 == cas2
{
    print("相等")
}

if cas2.hasPrefix("ca")
{
    print("有前缀")
}




//#MARK:- 元组
//元组:用来归类具有任意类型的关联值
let Respond = (200,"NOT Found") //类型可以理解为（int，String）类型
//元组解绑方式1：创建元组变量
let (stateCode,Infor) = Respond;

print("状态码:\(stateCode)")
print("信息:\(Infor)")

//元组解绑方式2:用索引
print(Respond.0)
print(Respond.1)


//元组解绑方式3：给元组里面的数据取名
let httpRespond = (stateCode:200,ResultInfo:"该账号已经登录")
print(httpRespond.stateCode)
print(httpRespond.ResultInfo)

//#MARK:- 可选类型
//可选类型:主要是为了解决有无值的问题
//可选类型申明：类型＋？ 如果可选类型申明没有初始化 则会默认赋nil
var schoolName:String?

if schoolName == nil
{
    print(schoolName)
}

//swift 中的nil 表示一个类型中没有值 可以是Int？，String？ 等
//可选类型强制解封：在Optinoal类型的常量或者变量后面＋！ 使用！去解封时这个可选类型一定不要是nil值

let value:String = "20"
let intValue = Int(value)
print(intValue!) //强制解封 不能是nil

if intValue==nil
{
    print("转换失败")
}
if intValue == 20
{
    print("转换成功：\(intValue!)")
}


//可选绑定方法解封:不用判断可选类型变量中是否有值 才去！解封，会先判断intValue 里面是否有值
//语法：可选绑定必须和if语句一起用 如果可选类型有值 则会把值直接赋予这个变量或者常量 如果为nil 则if条件为假同时不会给变量或者常量赋值
if let constnat = intValue
{
    print(constnat)
}

if var cons = schoolName
{
    print("有值\(cons)")
}else
{
    print("没有值")
}

//隐式解封可选类型：如果能够确定可选类型中一定有值 则可以使用隐式解封来优化程序
//语法：类型后面＋！
let assumedString : String! = "隐式可选类型，一定有值"
//解封 ：不用加！来强制解封
print("隐式可选类型值：\(assumedString)")
//对比
let assumedString2:String? = "需要强制解封"
if assumedString2 == nil
{
    
}
else
{
    print("\(assumedString2!)")
}

//notice:如果隐式解封类型为nil 也会报错
//assert :断言 作用：当出现错误时 中断程序 打印错误
//var age = -2
//assert(age>0, "年纪为:\(age) 不能小于0")

//集合 :swift 提供了两个类型的集合 分别是数组和字典



//#MARK:- 数组
/*******************************数组************************************/
//数组类型的两种写法：Array<SomeType>,如Arrary<Int>、Array<String>
//[String]、[Int] (简化版)

//数组字面量 定义
var Student:Array<String> = ["name","age","sex"]
let Teacher:[String] = ["name","age","old"]
//如果在定义的时候显式的指定了数组的类型，则数组里面只能存储对应的类型
//如果没有显式的指定，则是AnyObject 任何对象  Any 表示任何类型
var commpany = ["name",20] //不指定类型的数组默认是NSObject 类型


//数组创建和初始化一个空数组
var list = Array<String>();
var secondList = [Int]()



//数组遍历
//方式1:for in  方式2:enumerate 这个函数会将数组中的每个元素作为一个类型为（index，value）的元组返回 
//方式3:通过下标访问
for item in Teacher
{
    print(item)
}

for (index,value) in Student.enumerate()
{
    print("index:\(index) value:\(value)")
}

var firstValue = Student[0]
Student[0] = "hongqi9"
print(Student)


//数组增加
//Teacher.append("clss");//常量不能增加
Student.append("clss")
print(Student)

commpany.append("200")
commpany.append(100)
print(commpany)

Student += ["cheng","ZOng","wang"]
Student.append("wode") //增加单个
Student.appendContentsOf(["swift","new","it"]) //增加一个集合
Student.insert("000001", atIndex: 0)
print(Student)

//数组个数、判断空
print("数组里面包含:\(Student.count)个元素")
//是否为空
if commpany.isEmpty
{
    print("数组为空")
    
}else
{
    print("数组不为空")
}

//清空数组
list.removeAll()
list = []


//#MARK:- 字典
/*******************************字典************************************/
//自建的类型做key的时候 必须遵循hash协议 做key的类型必须是一个可以hash化的类型 String Bool Int Double 都可以
//字典类型定义：Dictionary<KeyType,ValueType>  [KeyType:ValueType]
//创建空字典
var dic1 = Dictionary<String,Int>();
var dic2 = [String:Int]()

//定义字典字面量
let dic3:Dictionary<String,String> = ["name":"王总成"]
let dic4:[String:String] = ["name":"德玛西亚皇子","age":"24"]
let dic5 = ["name":"奎恩","age":24]

//字典里面的健值对个数
dic4.count;

//判断是否为空
dic4.isEmpty;

//增加一个键值对
dic1["key"] = 2009

//修改键的值
dic1["key"] = 20010

//dic1.updateValue(234543, forKey: "key")//如果对应的健值对 不存在 则返回的是nil 否则返回的是更新前的值

if let oldValue = dic1.updateValue(233, forKey: "key")
{
    print("旧的值\(oldValue)")
}


//获取value
if let releaseData = dic1["key"]
{
    
}
else
{
    
}

//移除
//dic1["key"] = nil
//if let key = dic1.removeValueForKey("key")
//{
//    print("移除成功\(key)")
//}//为nil
//else
//{
//
//}


//获取所有的健
let keys = [String](dic1.keys)
let values = dic1.values

//字典遍历 元组
for (key,Vaule) in dic1
{
    print("key:\(key) Value:\(Vaule)")
}
for keyValue in dic1
{
    print("\(keyValue.0) \(keyValue.1)")
}


//清空
dic1.removeAll()
dic1 = [:]
//#MARK:- Struct 和 Class 的区别

//stuct 和 class 的区别 ：前者是值类型 后者是引用类型 前者是分配到栈区的 后者是分配到堆区
//结构体:自定义的类型  对应基本数据类型的本质也是结构体
//结构体定义格式：struct 结构体名 ：协议｛ 属性和方法 ｝
struct StructName{
    
    var width : Double
    var height : Float
    var result: Double
    
    func description() {
        
        print("我是reslut：\(result) width:\(width)")
    }
}

var ns:StructName = StructName(width: 100.0,height: 200.00,result:200.00)
//访问内部属性和方法
ns.description()
print(ns.width)


//枚举类型
//定义格式：enum 名字{  case 名字   }

enum ElectType {
    case ShuiFei
    case Elect
    case meiqi
}

var ele = ElectType.ShuiFei
print(ele)

//swift 中的枚举和其他语言中不一样 有个默认值  它的值就是ElectType.ShuiFei ElectType.Elect  ElectType.meiqi


//switch 语句 必须涵盖所有的值 否则用default 来涵盖
switch ele
{
case ElectType.ShuiFei:
    print("税费")
case ElectType.Elect:
    print("电费")
default :
    print("默认")
}

//#MARK:- 运算符
/***************************运算符**************************/
//&+ &- &/ &* &%  溢出运算
let zero = 0
//print("＝ \(3 &/ zero)")

//闭区间 a...b  a到b 包括 b 半开区间 a..<b  不包括b
for index in 0...10{
    
    
}


//运算符重载
//操作符重载 单目运算符 需要在前面加prefix 或者postfix 表明是前置还是后置
struct Sword {
    
    var name:String
    var width:Int
    
    func destription() {
        
        print("\(name)")
    }
    
}

//加
func +(left:Sword,right:Sword) -> Sword {
    
    return Sword(name: left.name+right.name,width: left.width+right.width)
}
//减
func -(left:Sword,right:Sword) -> Sword {
    
    return Sword(name: left.name + right.name,width: left.width - right.width)
    
}

//前置负数运算符 -a
prefix func -(sword:Sword) ->Sword
{
    return Sword(name: sword.name,width: -sword.width)
    
}

//后自加 运算符函数 ++运算符在3.0之后被移除了 inout关键字让行参可以改实参的值
postfix func ++(inout sword:Sword)->Sword
{
    return Sword(name: "mow", width: sword.width+1)
}

//自定义的Sword类型的逻辑相等
func ==(left:Sword,right:Sword) -> Bool {
    
    return (left.width == right.width && left.name == right.name) ? true : false
}


var  smallSword1 = Sword(name: "smallSrord1", width: 200)
var smallSword2 = Sword(name: "smallSrord2", width: 10)

var bigSword = smallSword1+smallSword2
print(bigSword)

if smallSword1 == smallSword2
{
    print("相等")
}
else
{
    print("NO")
}


//自定义运算符
//operator infix/prefix/postfix 自定义运算符｛｝
//infix/prefix/postfix func (参数列表)->返回类型

//#MARK:- 循环 两种方式 Switch
//for 循环 两种方式
//for item in collectType
//for var index;index<cout;index++


//while (){}  

//不知道具体个数的时候采用while更好
//if 条件 {}

//如果case 条件下有语句则不需要break 如果case下为空语句则需要break来占行 所有情况需要举完 否则 要用default

//switch 支持条件查询
/*
 switch 条件｛
 
    case 值 1:
        响应值1
 case 值2，值3:
 响应值2和3
 
 default：
 
 ｝
*/
//switch 支持元组

var student = (2016,"杭州电子科技大学")

switch student
{
case (2016,"杭州电子科技大学"):
    print("美女很多")
default:
    print("")
}


//switch 支持区间操作

var position = 33
switch position
{
case 0...14,90..<120:
    print("不安全")
case 30...50:
    print("安全")
default:
    print("任务失败")
}

//switch 支持值绑定和条件值绑定
//元组和可选类型本质就是对所需类型的封装
//continue 的用法
for index in 0...8
{
    if index == 2
    {
        continue
    }
    print(index)
}

outLabel:for i in 0...8
{
    for j in 0...2
    {
        if i == 2
        {
            continue outLabel //如果不指定跳转到哪一层 默认最近
        }
        
        print("i:\(i) j:\(j)")
    }
}


//break 用法
for i in 1...10
{
    if i == 2
    {
        break
    }
    print("\(i)")
}

outFor:for index in 0...10
{
    for path in 2...4
    {
        if path == 3
        {
            break outFor
        }
        
        print("我的  \(path)")
    }
}

//fallthrough swift 默认case 后面有break ，如果想让所有的条件语句都执行 则用fallthrough

var 王宗成 = 22
switch 王宗成
{
case 22:
    print("22")
    fallthrough
case 20:
    print(20)
    fallthrough
default:
    print("最后一句")
}

//#MARK:-函数
/*************************函数**************************/
/*
 func <#name#>(<#parameters#>) -> <#return type#> {
 <#function body#>
 }
 */

func doHomeworking(workName:String,time:String,tele:String) -> String {
    
    return workName+time+tele;
}

/* *********************行参取外部名字****************/
//给函数行参 取外部名字 方便赋值之后阅读代码方便 由于系统默认会给第二个开始的参数添加外部参数名 所有我们只需指定第一个

func sleep(startTime startTime:String,endTime:String) -> String {
    
    return startTime+endTime;
}

print(sleep(startTime: "wode", endTime: "youde"))

print(doHomeworking("体育课", time: "明天下午", tele: "15958171354"))

/**********************可变参数个数****************/
//函数里面的参数可变 可变参数最多只能有一个  而且必须放在最后一个
func sum(numbers:Int...) -> Int {
    
    var total = 0
    for number in numbers {
        
        total += number
    }
    
    return total;
    
}

//上诉方法与这个等价
func sum1(numbers:[Int]) -> Int {
    
    var total = 0
    for number in numbers {
        
        total += number
    }
    
    return total;
    
}

print(sum(1,2,3,4,5,6))

print(sum1([23,12,20]))


/*******************给行参数默认值**********************************/
//可以给函数的参数默认赋值 如果在调用函数的时候不赋值 则使用默认的值 行参赋值则使用赋的新值
func running(kilomiter:String = "20公里") -> String {
    
    return kilomiter
}

//使用默认值
print(running())
print(running("800公里"))

func releax(time time:String = "2015.04.05",address:String) -> String {
    
    return time+address
}

var address = "杭州市西湖区"

print(address)
print(releax(address: address))
print(address)

//交换两个变量的值

var a = 10
var b = 20
swap(&a, &b)
print(a)
print(b)

//inout关键字 可以在函数类改行的值参映射到实参 其实差不多是取地址符号的意思
func swap1(inout a a:Int,inout b:Int) {
    
    let tem = a
    a = b
    b = tem
}

swap1(a: &a , b: &b)
print(a)
print(b)

//使用了inout 之后不能在用var 或者 let 标记 inout 标记的只能是变量

//没有返回类型
//
//
//func <#name#>(<#parameters#>)  {
//    <#function body#>
//}

//感觉函数调用和C语言差不多





/***************多个返回值***********************/
//返回多个值 返回的参数 是 元组
func more(dics:[String:String]) -> (count1:Int,count2:Int) {
    
    return (20,30)
}


var item = more(["key":""])
print(item.count1)
print(item.count2)

print("")

//函数本质是一个新的类型  定义一个函数 实际上是在定义一个新的类型 函数的类型名：(参数类型名)＋返回值类型名
//上面的more 函数的类型为:（[String:String]）->(Int,Int)

//1、定义一个函数类型的变量
var moreVar:([String:String])->(Int,Int) = more

//现在用这种函数类型的变量和函数more直接用是一样的了
var item1 = moreVar(["key":"value"])
print(item1.0)
print(item1.1)

print("")
//2、函数类型的行参

func moreFacade(moreFunc:([String:String])->(Int,Int),kids:[String:String]) -> (Int,Int) {
    
    return moreFunc(kids)
}
//调用
var m = moreFacade(more, kids: ["wnag":"zong"])
print(m.0)
print(m.1)


//函数类型作为返回值

func dont(name name:String) -> Bool {
    
    return true
}

func don(name name:String) -> Bool {
    
    return false
}

func choseBankBusiness(bank:String) -> (String)->Bool  {
    
    if bank == "我的" {
        
        return dont
    }
    else
    {
        return don
    }
    
}

//柯里化函数 这种写法在后面会被swift移除掉

//func family(address:String)(number:Int)(roomNumber:Int) -> String {
//    
//    
//    return address
//}


/****************闭包**********************/

func compare(a:Int,b:Int) -> Bool {
    
    return a>b
}


func sort(nums:[Int],comp:(Int,Int)->Bool) -> [Int] {
    
    var newNums = nums
    
//    //冒泡法:把两个相近的两个数比较
//    for _ in 0..<nums.count {
//        
//        for j in 0 ..< nums.count-1
//        {
//            if comp(newNums[j],newNums[j+1]) {
//                
//                let tem : Int = newNums[j]
//                newNums[j] = newNums[j+1]
//                newNums[j+1] = tem
//            }
//        }
//    }
    
    
    //选择法
    
    for i in 0..<nums.count {
        
        var index = 0
        var tem = newNums[i]
        
        for j in i+1..<nums.count {
            
            if comp(tem, newNums[j]) {
                
            }
            else
            {
                tem = newNums[j]
                index = j
            }
            
        }
     
        if index != 0 {
            
            let m = newNums[i]
            newNums[i] = newNums[index]
            newNums[index] = m
        }
    }
    
    return newNums
}
//
var comp:(Int,Int)->Bool = compare
print(sort([20,43,32,90], comp: comp))

//#MARK:- 闭包
//闭包：可以把简单的函数用 闭包表达式来解决  如上面的compare函数
var arr = sort([20,43,32,90], comp: {(a:Int,b:Int)->Bool in return a>b})
print(arr)

//闭包的格式
/*
 {
    （参数列表）in 函数体
 }
 */

//闭包表达式简化
print(sort([23,43,45], comp: {a,b in return a>b})) //根据类型推断 省略类型
print("")
print(sort([23,43,45], comp: {a,b in a>b})) //只有一行代码 省略掉return
print(sort([23,43,45], comp: {$0>$1}))
print(sort([23,43,20], comp: >))

//尾闭包：针对多行函数的简化 ：闭包表达式在函数参数最后一个位置  如果闭包表达式只有一行的情况下 没必要使用尾闭包  如果函数里面只有闭包表达式一个参数
sort([23,45,2,19]){$0 > $1}

//捕获值
//返回的是一个函数类型 结果
func outFun(amout:Int) -> ()->Int {
    
    var runningTotal = 0
    //函数的本质也是一个类别
    func incre() ->Int
    {
        runningTotal += amout
        return runningTotal
    }
    //实际上是返回了一个（）－>Int 类型的变量
    return incre
}

let s = outFun(20)
print(s())//20
print(s())//40











//#MARK:-面向对象
/**************************swift 面向对象****************************/
//类关键字 Class
class Person{
    
    let sex = "male"
    var name :NSString = ""
    
}

//实列化一个对象
var person1 = Person()
print(person1.sex)
person1.name = "王宗晨"
print(person1.name)

//存储属性：就是在一个类中定义一个常量或者变量，分为常量存储属性，变量存储属性 格式：var 变量名 ＝ 初始值
//惰性存储属性：类的某些属性必须要有，但是不是一开始的时候就有，经常出现在类初始化的时候没有，到了一定时间或者某个条件出发后才存在，这种属性叫做惰性存储属性。    定义格式:lazy var 变量名 ＝ 初始值


//计算属性：通过是否写属性的set、get方法来实现读写权限控制，可以实现间接改变变量属性的值，计算属性必须为var   ，格式：var 变量名：类型｛get｛｝ set｛｝｝
//类型属性：类型属性是某种类型的所有实列对象都能共享的一个数据（好比C语言中的Static 常量） 类型属性在定义的时候必须设置初始值 格式：Class var 变量名：类型｛ get ｝


//存储属性才会占用内存空间 计算属性和类型属性不占用内存空间
class Buddha {
    
    var name:String
    init(name:String)
    {
        self.name = name
    }
    
}


class Animal {
    
    var name:String = ""
    //惰性属性
    lazy var sex:String = ""
    lazy var buddha = Buddha(name: "今天要学习完Swift")
    let address:String = "哈哈"
    //计算属性
    var number:String
        {
        
        get{
            
            return "12061424"
        }
        
//        set{
//        
//            self.number = newValue
//        }
        
    }
    
    
    func pray(){
        
        print("我除了闭包之外的都会了:\(buddha.name)")
    }
}

//实列化的时候 如果属性有lazy 关键字 则不会分配内存，当需要用到改属性的时候才会分配内存 
//惰性属性使用情况：在类构造实列时无法知道属性所依赖的外部信息，则使用惰性属性，当属性值需要大量复杂的计算是，为了避免阻塞对象初始化,则使用惰性属性.惰性属性必须声明成变量
var animal = Animal()
animal.pray()
print(animal.number)

//计算属性 可以设定访问权限,计算属性，可以间接的获取或者改变其他属性的值，他并不占用内存
//如果一个属性没有写set 、get 方法其默认具有读写权限 如果两者都写了则不影响 而假如只写其中一个则另外一个权限必将受到限制
//通过设置set 、 get 来设置读写权限


class Languae {
    
    class var Clanguage: String {
        
        get{
        
            return "我知道"
        }
    }
}

print(Languae.Clanguage)

//Languae.Clanguage = "我是真的不想在吃冰了"

var langu = Languae()

//langu.Clanguage = "2008北京奥运会"

print(Languae.Clanguage)


/*************************属性观察器******************************/

class Food {
    
    var madeAddress:String = "" //存储属性
    lazy var number:Int = 0 // 惰性存储属性
    //类型属性
    class var price:Int {
        
        get{
            
            return 20
        }
    }
    
    //计算属性
    var allPrice:Int{
        
        get{
            
            return number
        }
        
        set
        {
            self.allPrice = newValue
        }
    }
    
    
    //属性观察器
    var shengnei = "浙江省"
        {
            willSet
            {
                //newValue 表示将要替换的新值 
                //oldValue 表示被替换之后，其之前的值
                print("willSet:\(newValue)")  //卧槽 上下
                print("willNow:\(shengnei)") //浙江省 卧槽
            }
        
            didSet{
                
                print("didnow:\(shengnei)")//卧槽 上下
                print("didSet:\(oldValue)") //浙江省 卧槽

            
            }
    }
    
//    subscript (number:Int)->String?
//        {
//        
//    
//    }
    
}

var food1 = Food()
food1.shengnei = "卧槽"
food1.shengnei = "上下"

//属性观察器 不仅仅适用于属性 也 适用于全局变量

var myAge = 20 {
    
    willSet
    {
        print("我现在:\(myAge)即将到:\(newValue)")
    }
    didSet
    {
        print("我以前:\(oldValue)现在:\(myAge)")
    }
}

myAge = 21


//继承 父类
class Car{

    var name:String = ""
    
    //计算属性
    var made:String
        {
    
            return "中国"
    }
    
    
    func producted(){
        
        print("我的名字是卡特:\(name)")
    }
    
    final func time(){
    
        print("time")
    }
    ////构造器:在可以有参数 在这里面完成存储属性的初始化 构造器方法不能直接调用 而是通过类来调用
    init(params:String)
    {
        name += params
    }
}

//继承
class BMW: Car {

    //复写属性
    override var made: String
        {
        
        return "美国"
    }
    
    //复写实列方法
    override func producted() {
        
        print("我的名字叫：\(name)")
    }
    
}

//swift 不允许多继承 即不能有多个父类
//父类的计算属性可以被子类复写 子类的读写权限必须大于等于父类
//重写需要在前面加关键字override  如果父类的方法或者属性不能让子类复写 则在属性或者方法前面加final 关键字

//实列化＋初始化
var bmwCar:BMW = BMW(params: "国通带你")
//存储属性的初始化:在使用之前，必须初始化 存储属性为可选类型时 如果不初始化 则为nil

//初始化的方式1、在定义属性的时候赋一个值 方式2、使用init构造器 来初始化

//重载：同一个类里面的方法名相同，参数列表不同(可以通过参数个数 或者 外部参数名来区分)  重写：子类继承父类 子类里面的方法名、参数列表完全相同    常见的重载：类的构造器

class KeyBoard {
    
    //方式1
    var address:String = ""
    
    var sign:String
    //方式2
    init (sign:String){
    
        self.sign = sign
    }
    //指定构造器
    init (axis:String,addres:String,sig:String)
    {
        self.sign = sig
        self.address = addres
        print("这个来自\(self.address) \(self.sign)品牌 \(axis)的机械键盘")
    }
    
    //便捷构造器 :简化指定构造器
    convenience init()
    {
        self.init(axis:"黑轴",addres: "日本",sig: "Filco") 
    }
    
    
    //重载 这里通过外用参数名来区分
    func keyNumber(chinese num:Int) {
        
        print("中国人喜欢用：\(num)健的键盘")
    }
    
    func keyNumber(american num:Int) {
        
        print("美国人喜欢用：\(num)健的机械键盘")
    }
    
    func keyNumber(num:Int,color:String) {
        
        print("人们喜欢用:\(num)的\(color)大F机械键盘")
    }
    
    
    //释放掉
    deinit{
        
        print("我被无情的抛弃了")
    }
}

class Board {
    
    var s:Double
    //可失败构造器
    init?(isCircle:Bool)
    {
        if isCircle {
            
            s = 0.134
        }
        else
        {
            return nil
        }
    }
    
}
//默认构造器
var HHKB = KeyBoard()

//指定构造器
var keyboard = KeyBoard(sign: "iKBC+Jaki+Cherry+Filco+HHKB+Duck")
keyboard.keyNumber(chinese: 87)
keyboard.keyNumber(american: 67)
keyboard.keyNumber(104, color: "白色")

var iKBC = KeyBoard(axis: "青轴", addres: "台湾", sig:"iKBC" )
//构造器类型:默认构造器（swift自动实现） 指定构造器（init）:必须调用直接父类的指定构造器    便捷构造器（为了简化指定构造器的使用而增加的）:必须调用同一个类中定义的其它构造器  成员构造器（只适合结构体） 可失败构造器

//可失败构造器
var boarded = Board(isCircle:false)
print(boarded?.s)

//子类
class Filco: KeyBoard {
    
    var weight = 0.0
    override init(axis: String, addres: String, sig: String) {
        super.init(axis: axis, addres: addres, sig: sig)
        address = "法宾西" //父类的存储属性 必须在调用super 之后才能调用
    }
    
}
//如果父类的构造器带参数 则需要显示的调用

//deinit 函数

class Sence {
    
    var image:String
    
    init(imag:String)
    {
        image = imag
        print("\(image)")
    }
    
    convenience init()
    {
        self.init(imag:"Default.png")
    }
    
    //析构函数 对象被释放的时候执行
    deinit
    {
    
        print("这个场景的图片\(image)即将被释放掉")
    }
    
}


class SenceBox {
    
    var sence:Sence = Sence()
    
    func next(image:String)
    {
     //这里会把第一个初始化的内存空间释放掉
        sence = Sence(imag: image)
    }
    
}

class AngryBird{
    
    var senceBox = SenceBox()
    func gotoNext() {
        
        senceBox.next("sky.png")
    }
    
    //释放掉
}
//MARK:- 愤怒的小鸟
var bird = AngryBird()
bird.gotoNext()
bird.gotoNext()
bird.gotoNext()

//MARK:- 两个变量或者常量是否引用了同一个对象 === !==  ＝＝ !=是用来比较值是否相等
var bird1 = bird

if bird === bird1
{
    print("这两个变量是引用了同一个对象")
}

//要设置为nil 必须为可选类型
var sence1:Sence? = Sence(imag: "icon.png") //1
var sence2:Sence? = sence1 //+1 = 2
var sence3:Sence? = sence2 // +1 = 3

sence3 = nil //-1 = 2
sence2 = nil //-1 = 1
sence1 = nil//-1 = 0  自动释放

//swift 的内存管理 道理和 OC是一样的
//MARK:- 循环引用问题
//举例：
class Cunsumer{
    
    //属性引用
    var hisIphone:Iphone?
    //函数引用
//    func myIphone() -> Iphone{
//        
//        let iphone = Iphone() //count = 1
//        print("这个手机的名字是\(iphone.name)")
//        return iphone
//        
//    }
    deinit
    {
        //对象已经被释放 不能在这里在释放iphone
        print("用户对象已经被释放")
    }
}

class Iphone {
    
    var name = "iphone 6s plus"
    weak var cunsumer:Cunsumer?
    
    init(cunsumer:Cunsumer)
    {
        self.cunsumer = cunsumer
    }
    deinit
    {
        print("手机对象已经被释放掉")
    }
}

//没问题 当cunsumer被释放掉了 手机
//var cunsumer:Cunsumer? = Cunsumer()
//cunsumer?.myIphone()
//cunsumer = nil

//这里会导致内存泄漏
//var cunsumer:Cunsumer? = Cunsumer()//cunsumer.retainCount=1
//var iph = cunsumer?.myIphone()//cunsumer.retainCount = 1
//iph?.cunsumer = cunsumer//cunsumer.retainCount = 2
//cunsumer = nil //cunsumer.retainCount = 1

//MARK:- 循环引用解决方案:弱引用、无主引用、捕获列表
//若变量或者常量指向的对象有可能为nil 即可选类型 则使用弱引用 在前面加weak
//若不为nil （隐式解封） 则使用无主引用
//如果使用闭包（OC 里面的代码块__weak typeof(self) weakself = self）里面有self引用 则使用捕获列表


//使用weak
var cunsumer:Cunsumer? = Cunsumer()//cunsumer.retainCount = 1
cunsumer?.hisIphone = Iphone(cunsumer: cunsumer!)//iph 2 //这里感觉和oc里面的set＋1 不一样(oc 里面的点语法实际上是调用set get 方法 set的时候会执行retaincount操作，所以为＋1):OC 里面创建会＋1 如果成员属性引用＋1 这时候需要在dealloc里面调用release
cunsumer = nil //cunsumer.retainCount = 0

//无主引用的场景:一旦初始化之后，都不能为nil的情况    其中一个为可选类型 一个为非可选类型

class Parent {
    
    var children:Children?
    
    deinit
    {
        print("父亲释放了")
    }
    
}

class Children{
    
    unowned var parent:Parent
    init(parent : Parent){
    
        self.parent = parent
    }
    
    deinit
    {
        print("孩子对象释放了")
    }
    
}

var p:Parent?
p = Parent();
p!.children = Children(parent: p!)
p = nil

//捕获列表解循环引用
//{[捕获列表 捕获对象](参数)->返回类型 in 闭包体}
class WeatherReport{
    
    let address:String
    let weather:String
    var temperature:Int?
    
    lazy var report:()->String = {
    
        [weak self] in
        
        if let tem = self!.temperature
        {
            return "今天\(self!.address)的天气\(self!.weather) \(tem)"
        }
        else
        {
            return "暂无报告"
        }
    }
    init(address addr:String,weat:String)
    {
        address = addr
        weather = weat
    }
    
    //下标访问方法 根据num 来处理逻辑
    subscript(num:Int)->String
        {
        
        get{
        
            return "王宗晨"
        }
        
        set{
                
                
        }
    }
    deinit
    {
        print("这个报告已经被释放掉了")
    }
}

var w:WeatherReport? = WeatherReport(address: "杭州", weat: "阴转多云")
w?.temperature = 35
print("我们这里的：\(w!.report())")
w = nil


//MARK:-类型转换和类型检查 ：is 完成类型检查 as 完成类型转换（类似（NSClassFormString（）））
class Fruit {
    
    var name : String
    init(n:String)
    {
        name = n
    }
    
    func destription() {
        
        print("我是苹果君")
    }
}

class Apple: Fruit {
    
    override  func destription() {
        
        print("我是苹果君")
    }

}


class Orange: Fruit{
    
   override func destription() {
        
        print("我是橘子君")
    }
    
}

let apple1 = Apple(n: "苹果大哥")
let apple2 = Apple(n: "苹果老二")
let apple3 = Apple(n: "苹果老三")

let orange1 = Orange(n: "🍊")

var basket = [apple1,apple2,apple3,orange1]

//类型转换：as 的左边参数只能是父类的实列 右边的参数只能是子类的类型 转换成功则返回一个子类的实列 否则返回一个nil
for fruit in basket
{

    fruit.destription()
    
//    if let apple = fruit as? Apple
//    {
//        apple.destription()
//    }
//    else if let orange = fruit as? Orange
//    {
//        orange.destription()
//    }
    
}

//类型检查： is 的左边参数只能是父类的实列 右边的参数只能是子类的类型
for fruit in basket
{
    if fruit is Apple
    {
        print("我是苹果啊")
    }
    else if fruit is Orange
    {
        print("我是🍊")
    }
}


//可以理解为默认继承Anyobject
class className{
    
}

var things = [Any]()

//定义一个(Int)->Double 类型的变量
func getResetTime(time:Int) -> Double {
    
    return Double(time*180)
}

things.append((23,"45"))
things.append(30)

things.append(getResetTime)

print(things)





