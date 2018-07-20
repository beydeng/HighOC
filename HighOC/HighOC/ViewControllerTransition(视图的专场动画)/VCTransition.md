#  Transition 解释
### 转场的本质是下一场景(子 VC)的视图替换当前场景(子 VC)的视图以及相应的控制器(子 VC)的替换，表现为当前视图消失和下一视图出现，基于此进行动画，动画的方式非常多

### iOS 7 以协议的方式开放了自定义转场的 API，协议的好处是不再拘泥于具体的某个类，只要是遵守该协议的对象都能参与转场，非常灵活。转场协议由5种协议组成，在实际中只需要我们提供其中的两个或三个便能实现绝大部分的转场动画：

- 转场代理(Transition Delegate)：
##### 自定义转场的第一步便是提供转场代理，告诉系统使用我们提供的代理而不是系统的默认代理来执行转场

```
<UINavigationControllerDelegate> //UINavigationController 的 delegate 属性遵守该协议。
<UITabBarControllerDelegate> //UITabBarController 的 delegate 属性遵守该协议。
<UIViewControllerTransitioningDelegate> //UIViewController 的 transitioningDelegate 属性遵守该协议。

```
###### 转场发生时，UIKit 将要求转场代理将提供转场动画的核心构件：动画控制器和交互控制器(可选的)；由我们实现

- 动画控制器
### 负责添加视图以及执行动画 
`<UIViewControllerAnimatedTransitioning>`
##### 最重要的一部分

- 交互控制器

`<UIViewControllerInteractiveTransitioning>`

##### 手势来驱动动画控制器实现的动画，使得用户能够控制整个过程

- 转场环境

`<UIViewControllerContextTransitioning>`

##### 由 UIKit 在转场开始前生成并提供给我们提交的动画控制器和交互控制器使用。

- 转场协调器

`<UIViewControllerTransitionCoordinator>`

##### 可在转场动画发生的同时并行执行其他的动画，主要是起到了辅助的功能，主要使用在 Modal 转场和交互转场取消时。

---------------

- 动画控制器（AnimationVC）

##### UIKit 在转场开始前生成遵守转场环境协议<UIViewControllerContextTransitioning>的对象 transitionContext，它有以下几个方法来提供动画控制器需要的信息：

```
- (UIView *)containerView; //返回容器视图，转场动画发生的地方

//获取参与转场的视图控制器，有 UITransitionContextFromViewControllerKey 和 UITransitionContextToViewControllerKey 两个 Key。 
- (nullable __kindof UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key;//

//新增 API 用于方便获取参与参与转场的视图，有 UITransitionContextFromViewKey 和 UITransitionContextToViewKey 两个 Key。
- (nullable __kindof UIView *)viewForKey:(UITransitionContextViewKey)key NS_AVAILABLE_IOS(8_0);

//你可以在 fromView 和 toView 上添加任何动画
```

##### 通过viewForKey:获取的视图是viewControllerForKey:返回的控制器的根视图，或者 nil。viewForKey:方法返回 nil 只有一种情况： UIModalPresentationCustom 模式下的 Modal 转场 ，通过此方法获取 presentingView 时得到的将是 nil



