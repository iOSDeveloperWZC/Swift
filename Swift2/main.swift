//
//  main.swift
//  Swift2
//
//  Created by ataw on 16/8/16.
//  Copyright © 2016年 王宗成. All rights reserved.
//

import Foundation


print("Hello, World!")

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
print(intValue!)
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
var threeDouble = [Double](count:3,repeatedValue:0.0)


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


//清空
dic1.removeAll()
dic1 = [:]

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


/***************************运算符**************************/
//&+ &- &/ &* &%  溢出运算
let zero = 0
//print("＝ \(3 &/ zero)")

//闭区间 a...b  a到b 包括 b 半开区间 a..<b  不包括b
for index in 0...10{
    
    
}


//自定义对象 运算符
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

//后自加 运算符函数 ++运算符在3.0之后被移除了
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








