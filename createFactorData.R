
setwd("C:/Users/razsa/Desktop/firstapp/bikewerbung")

mat = matrix(ncol = 3, nrow = 100)

# for the age column
mat[,1] = sample(16:90, 100, replace = T)

# For the number column
mat[,2] = sample(250:400, 100, replace = T)

# for the ort
mat[1:33,3] = "Ort A"
mat[33:53,3] = "Ort C"
mat[54:73,3] = "Ort B"
mat[74:100,3] = "Ort D"


df = data.frame(mat)

rnames = c("age", 'anzahl', 'ort')
colnames(df) = rnames
df$anzahl = as.numeric(df$anzahl)
df$group = as.numeric(df$group)

write.table(df, file = "bikeberwung.csv", sep = ',',
            row.names = F)


df2 <- read.csv("bikeberwung.csv")


df2 %>% 
  mutate(ageGroup = case_when(
    between(age, 15, 25) ~ "GroupA",
    between(age, 26, 40) ~ "GroupB",
    between(age, 41, 65) ~ "GroupC",
    between(age, 66, 100) ~ "GroupD",
    TRUE ~ NA_character_
  ))
