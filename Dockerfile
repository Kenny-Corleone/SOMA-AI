FROM openjdk:17-jdk-slim

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y wget unzip git && \
    rm -rf /var/lib/apt/lists/*

# Установка Android SDK
ENV ANDROID_SDK_ROOT /sdk
RUN mkdir -p $ANDROID_SDK_ROOT && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O /cmdline-tools.zip && \
    unzip /cmdline-tools.zip -d /sdk && \
    rm /cmdline-tools.zip && \
    mkdir -p /sdk/cmdline-tools/latest && \
    mv /sdk/cmdline-tools/* /sdk/cmdline-tools/latest/ || true
ENV PATH "$PATH:/sdk/cmdline-tools/latest/bin:/sdk/platform-tools:/sdk/emulator"

# Установка необходимых компонентов SDK
RUN yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses
RUN sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-34" "build-tools;34.0.0" "cmdline-tools;latest"

# Установка Gradle
ENV GRADLE_VERSION 7.6
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt && \
    rm gradle-${GRADLE_VERSION}-bin.zip
ENV PATH "/opt/gradle-${GRADLE_VERSION}/bin:${PATH}"

# Копирование проекта внутрь контейнера
WORKDIR /workspace
COPY . /workspace

# Сборка APK
RUN gradle assembleDebug

CMD ["/bin/bash"] 