install.packages('ggplot2')
library(ggplot2)

# mtcars
View(diamonds)

View(iris)
# 單變數: 類別型
ggplot(data=iris, aes(x=Species)) +
  geom_bar(fill="blue", colour="black")

# 單變數: 連續型
ggplot(data=iris, aes(x=Sepal.Length)) + geom_histogram()

# 雙變數: 連續型VS連續型
ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length)) +
  geom_point()

# 雙變數: 類別型VS連續型
ggplot(data=iris, aes(x=Species, y=Petal.Width)) +
  geom_boxplot()

# 多變量: 鳶尾花的總體關係
library(ggplot2)
library(GGally)
library(scales)
library(memisc)

# 從數據集獲取10000個樣本數據進行分析
iris_samp <- iris[sample(1:length(iris$Species), 100), ]
ggpairs(iris_samp,lower= list(continuous = wrap("points", shape = I('.'))),
        upper = list(combo = wrap("box", outlier.shape = I('.'))))