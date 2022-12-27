export class Drawable {

    // Родительский класс для всех отрисовываемых объектов
    // На вход принимает context - родительский canvas, на котором объект отрисовывается
    // x, y - начальные координаты объекта
    constructor(context, x, y) {
        this.x = x;
        this.y = y;
        this.context = context;
        this.visibility = true;

        this.setSize(64, 64);
    }



    // Выставляем видимость объекта
    setVisibility(enable) {
        this.visibility = enable;
    }

    // Выставляем размеры объкета
    setSize(x, y) {
        this.width = x;
        this.height = y;
    }

    // Выставляет скорость объекта
    setSpeed(x, y) {
        this.speedX = x;
        this.speedY = y;
    }


    // Выставляем путь для изображения объекта
    setImage(path) {
        let self = this
        let image = new Image();
        image.onload = function () {
            self.context.drawImage(image, self.x, self.y, self.width, self.height);
            self.image = image;
        }
        image.src = path;
    }


    // Рисует объект каждый кадр
    draw() {
        try {
            this.context.drawImage(this.image, this.x - this.width / 2, this.y - this.height / 2, this.width, this.height);
        } catch (e) {

        }
    }


    // Чистит кадр объекта
    clear() {
        this.context.clearRect(this.x - this.width / 2 - 2, this.y - this.height / 2 - 2, this.width + 4, this.height + 4);
    }

    getName() {
        return 'drawable'
    }


    // Событие вызываемое каждый тик
    tick() {
    }


    // Метод вызываемый при пересечении объекта
    collideAction() {

    }


    // Проверка на то что объект в зоне видимости
    isExpired() {
        if (this.y > this.context.height + this.height) {
            return true;
        }

        if (this.x > this.context.width + this.width) {
            return true;
        }

        if (this.x < -this.width) {
            return true;
        }

        if (this.y < -this.height) {
            return true;
        }

        return false;
    }


    // Ускорение скорости объекта, зависящее от скорости игры
    getSpeedScaler() {
        let mode = window.speed;

        let scaler = 1;

        if (mode === undefined) {
            return scaler;
        }

        if (mode === 0) {
            return 0.2;
        }

        if (mode === 1) {
            return 0.6;
        }

        if (mode === 2) {
            return 1;
        }

        if (mode === 3) {
            return 1.5;
        }

        if (mode === 4) {
            return 2;
        }
    }

}