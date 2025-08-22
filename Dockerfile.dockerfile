# -------- Build Stage --------
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy toàn bộ code vào container
COPY . .

# Build project Maven, bỏ test cho nhanh
RUN mvn clean package -DskipTests

# -------- Run Stage --------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy file jar đã build từ stage trước
COPY --from=build /app/target/*.jar app.jar

# Expose port cho Render (Render sẽ map biến $PORT)
ENV PORT 8080
EXPOSE $PORT

# Lệnh chạy ứng dụng
CMD ["java", "-jar", "app.jar"]
