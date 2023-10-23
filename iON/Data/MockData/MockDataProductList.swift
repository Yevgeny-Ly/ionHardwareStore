//
//  MockDataProductList.swift
//  iON
//
//  Created by Евгений Л on 02.10.2023.
//

import UIKit

// создаю тестовые данные и подписываю на базовый класс NSObject
class MockDataProductList: NSObject {

// буду обращаться к типу, а не к классу через сlass
    class func generateDataList() -> [[String: String]] {
        return [["id" : "00i0p0h0o0n0e0001", "picture":"iPhone14AlpineGreen", "cost":"79990", "oldCost":"89990", "name": "Смартфон iPhone 14 128ГБ альпийский зелёный", "description":"Phone 13 - сильный мира всего. Мы разработали совершенно новую схему расположения и развернули объективы на 45 градусов. Благодаря этому внутри корпуса поместилась наша лучшая система двух камер с увеличенной матрицей широкоугольной камеры. Кроме того, мы освободили место для системы оптической стабилизации изображения сдвигом матрицы. И повысили скорость работы матрицы на сверхширокоугольной камере. Новая сверхширокоугольная камера видит больше деталей в тёмных областях снимков. Новая широкоугольная камера улавливает на 47% больше света для более качественных фотографий и видео. Новая оптическая стабилизация со сдвигом матрицы обеспечит чёткие кадры даже в неустойчивом положении. Режим «Киноэффект» автоматически добавляет великолепные эффекты перемещения фокуса и изменения резкости. Просто начните запись видео. Режим «Киноэффект» будет удерживать фокус на объекте съёмки, создавая красивый эффект размытия вокруг него. Режим «Киноэффект» распознаёт, когда нужно перевести фокус на другого человека или объект, который появился в кадре. Теперь ваши видео будут смотреться как настоящее кино. Хотите переместить фокус или добавить эффект художественного размытия по окончании съёмки? Не проблема. С iPhone для этого достаточно нескольких касаний. На такое способны даже не все профессиональные кинокамеры"],
                
                ["id" : "00i0p0h0o0n0e0002", "picture":"iPhone14ProDeepPurple", "cost":"106490", "oldCost":"109990", "name": "Смартфон iPhone 14 Pro 256ГБ глубокий фиолетовый", "description":"iPhone 14 Pro поднимает планку возможностей 48 мегапикселей, обеспечивая в 4 раза большее разрешение в ProRAW для умопомрачительной детализации в каждом кадре. Новая система Pro Camera System добавляет к диапазону зума телеобъектив оптического качества в 2 раза, что обеспечивает большую гибкость при съемке. Кинематографический режим теперь снимает в формате 4K HDR со скоростью 24 кадра в секунду — стандарт киноиндустрии. Пусть ваши сотрудники позвонят нашим сотрудникам. Теперь вы можете легко редактировать вместе с другими профессиональными кадрами в формате 4K со скоростью 24 или 30 кадров в секунду. Вы даже можете отредактировать эффект глубины после съемки. Делайте самые четкие, красочные снимки крупным планом и групповые снимки благодаря новой фронтальной камере TrueDepth с автофокусом и увеличенной диафрагмой. Несмотря на оооочень много новых возможностей, iPhone 14 Pro по‑прежнему обеспечивает потрясающее время автономной работы в течение всего дня. Получайте еще больше удовольствия от своего iPhone."],
                
                ["id" : "00i0p0h0o0n0e0003", "picture":"iPhone14ProMaxGold", "cost":"164990", "oldCost":"174990", "name": "Смартфон iPhone 14 Pro Max 512ГБ золотой", "description":"Новый волшебный способ взаимодействия с iPhone. Новаторские функции безопасности, призванные спасать жизни. Инновационная 48-мегапиксельная камера для потрясающей детализации. Все они оснащены новейшим чипом для смартфонов. С керамическим экраном, более прочным, чем стекло любого смартфона. Водонепроницаемость. Нержавеющая сталь хирургического класса. Представляем Dynamic Island, по-настоящему инновационную разработку Apple, состоящую из аппаратного и программного обеспечения. Он воспроизводит музыку, спортивные результаты, FaceTime и многое другое — и все это, не отвлекая вас от того, что вы делаете. Дисплей всегда включен. Всегда наготове. Дисплей, который на солнце становится в 2 раза ярче. Теперь экран блокировки всегда виден, поэтому вам даже не нужно нажимать на него, чтобы оставаться в курсе событий. Когда iPhone повернут лицевой стороной вниз или лежит в кармане, он гаснет, чтобы сэкономить время автономной работы. iOS 16 позволяет по-новому настраивать экран блокировки. Наложите слой на фотографию, чтобы сделать ее всплывающей. Отслеживайте свои звонки активности. И смотрите текущие обновления из ваших любимых приложений."],
                
                ["id" : "00i0p0h0o0n0e0004", "picture":"iPhone15ProTitaniumBlue", "cost":"199900", "oldCost":"205990", "name": "Смартфон iPhone 15 Pro 512ГБ синий титан", "description":"Phone 15 Pro: новый король смартфонов с инновационными функциями! Встречайте мощный и стильный iPhone с передовыми технологиями! Представляем iPhone 15 Pro, новый флагман Apple, который изменит ваше представление о смартфонах. Он оснащен OLED-дисплеем с диагональю 6.1 дюйма и технологией Super Retina XDR для непревзойденной цветопередачи и яркости. В основе iPhone 15 Pro лежит мощнейший процессор A17 Pro, который гарантирует молниеносное быстродействие и плавную работу при любых нагрузках. Тройная камера с оптической стабилизацией обеспечивает потрясающие снимки и кинематографические видео. Технология Face ID гарантирует быструю и безопасную аутентификацию. Аккумулятор увеличенной емкости поддерживает быструю зарядку, позволяя работать и играть весь день без перерыва. Поддержка 5G гарантирует быстрое и стабильное подключение в любой точке мира. Стильный дизайн с прочным корпусом и защитой от воды и пыли сделает iPhone 15 Pro вашим идеальным компаньоном. Если вы хотите быть впереди всех в мире технологий, iPhone 15 Pro создан именно для вас!"],
                
                ["id" : "00i0p0h0o0n0e0005", "picture":"iPhone15ProTitaniumBlack", "cost":"204990", "oldCost":"219990", "name": "Смартфон iPhone 15 Pro 512ГБ чёрный титан", "description":"iPhone 15 Pro: новый король смартфонов с инновационными функциями! Встречайте мощный и стильный iPhone с передовыми технологиями! Представляем iPhone 15 Pro, новый флагман Apple, который изменит ваше представление о смартфонах. Он оснащен OLED-дисплеем с диагональю 6.1 дюйма и технологией Super Retina XDR для непревзойденной цветопередачи и яркости. В основе iPhone 15 Pro лежит мощнейший процессор A17 Pro, который гарантирует молниеносное быстродействие и плавную работу при любых нагрузках. Тройная камера с оптической стабилизацией обеспечивает потрясающие снимки и кинематографические видео. Технология Face ID гарантирует быструю и безопасную аутентификацию. Аккумулятор увеличенной емкости поддерживает быструю зарядку, позволяя работать и играть весь день без перерыва. Поддержка 5G гарантирует быстрое и стабильное подключение в любой точке мира. Стильный дизайн с прочным корпусом и защитой от воды и пыли сделает iPhone 15 Pro вашим идеальным компаньоном."],
                
                ["id" : "00i0p0h0o0n0e0006", "picture":"iPhone15ProMaxTitaniumBlue", "cost":"224990", "oldCost":"229990", "name": "Смартфон iPhone 15 Pro Max 512ГБ синий титан", "description":"iPhone 15 Pro: новый король смартфонов с инновационными функциями! Встречайте мощный и стильный iPhone с передовыми технологиями! Представляем iPhone 15 Pro, новый флагман Apple, который изменит ваше представление о смартфонах. Он оснащен OLED-дисплеем с диагональю 6.1 дюйма и технологией Super Retina XDR для непревзойденной цветопередачи и яркости. В основе iPhone 15 Pro лежит мощнейший процессор A17 Pro, который гарантирует молниеносное быстродействие и плавную работу при любых нагрузках. Тройная камера с оптической стабилизацией обеспечивает потрясающие снимки и кинематографические видео. Технология Face ID гарантирует быструю и безопасную аутентификацию. Аккумулятор увеличенной емкости поддерживает быструю зарядку, позволяя работать и играть весь день без перерыва. Поддержка 5G гарантирует быстрое и стабильное подключение в любой точке мира. Стильный дизайн с прочным корпусом и защитой от воды и пыли сделает iPhone 15 Pro вашим идеальным компаньоном."],
                
                ["id" : "00i0p0h0o0n0e0007", "picture":"iPhone14ProStarLight", "cost":"95990", "oldCost":"99990", "name": "Смартфон iPhone 14 256ГБ сияющая звезда", "description":"Новый волшебный способ взаимодействия с iPhone. Новаторские функции безопасности, призванные спасать жизни. Инновационная 48-мегапиксельная камера для потрясающей детализации. Все они оснащены новейшим чипом для смартфонов. С керамическим экраном, более прочным, чем стекло любого смартфона. Водонепроницаемость. Нержавеющая сталь хирургического класса. Представляем Dynamic Island, по-настоящему инновационную разработку Apple, состоящую из аппаратного и программного обеспечения. Он воспроизводит музыку, спортивные результаты, FaceTime и многое другое — и все это, не отвлекая вас от того, что вы делаете. Дисплей всегда включен. Всегда наготове. Дисплей, который на солнце становится в 2 раза ярче. Теперь экран блокировки всегда виден, поэтому вам даже не нужно нажимать на него, чтобы оставаться в курсе событий. Когда iPhone повернут лицевой стороной вниз или лежит в кармане, он гаснет, чтобы сэкономить время автономной работы. iOS 16 позволяет по-новому настраивать экран блокировки. Наложите слой на фотографию, чтобы сделать ее всплывающей. Отслеживайте свои звонки активности. И смотрите текущие обновления из ваших любимых приложений."],
                
                ["id" : "00i0p0h0o0n0e0008", "picture":"iPhone14ProSilver", "cost":"101990", "oldCost":"104990", "name": "Смартфон iPhone 14 Pro 128ГБ серебристый", "description":"iPhone 14 Pro поднимает планку возможностей 48 мегапикселей, обеспечивая в 4 раза большее разрешение в ProRAW для умопомрачительной детализации в каждом кадре. Новая система Pro Camera System добавляет к диапазону зума телеобъектив оптического качества в 2 раза, что обеспечивает большую гибкость при съемке. Кинематографический режим теперь снимает в формате 4K HDR со скоростью 24 кадра в секунду — стандарт киноиндустрии. Пусть ваши сотрудники позвонят нашим сотрудникам. Теперь вы можете легко редактировать вместе с другими профессиональными кадрами в формате 4K со скоростью 24 или 30 кадров в секунду. Вы даже можете отредактировать эффект глубины после съемки. Делайте самые четкие, красочные снимки крупным планом и групповые снимки благодаря новой фронтальной камере TrueDepth с автофокусом и увеличенной диафрагмой. Несмотря на оооочень много новых возможностей, iPhone 14 Pro по‑прежнему обеспечивает потрясающее время автономной работы в течение всего дня. Получайте еще больше удовольствия от своего iPhone."],
                
                ["id" : "00i0p0h0o0n0e0009", "picture":"iPhone14MidNight", "cost":"79990", "oldCost":"89990", "name": "Смартфон iPhone 14 128ГБ тёмная ночь", "description":"Тонкий и легкий смартфон из новой линейки Apple iPhone 14 с высоким разрешением OLED-экрана, хорошим объемом памяти и запасом автономности во влагостойком корпусе. Продвинутые камеры позволят снимать фото и видео в отличном качестве даже при слабом освещении. Функция экстренной помощи со связью через спутник выручит, когда нет возможности выйти в интернет. Мощный процессор откроет новые возможности для игр и развлечений."],
                
                ["id" : "00i0p0h0o0n0e00010", "picture":"iPhone14ProMaxSilver", "cost":"131990", "oldCost":"136990", "name": "Смартфон iPhone 14 Pro Max 256ГБ серебристый", "description":"Новый волшебный способ взаимодействия с iPhone. Новаторские функции безопасности, призванные спасать жизни. Инновационная 48-мегапиксельная камера для потрясающей детализации. Все они оснащены новейшим чипом для смартфонов. С керамическим экраном, более прочным, чем стекло любого смартфона. Водонепроницаемость. Нержавеющая сталь хирургического класса. Представляем Dynamic Island, по-настоящему инновационную разработку Apple, состоящую из аппаратного и программного обеспечения. Он воспроизводит музыку, спортивные результаты, FaceTime и многое другое — и все это, не отвлекая вас от того, что вы делаете. Дисплей всегда включен. Всегда наготове. Дисплей, который на солнце становится в 2 раза ярче. Теперь экран блокировки всегда виден, поэтому вам даже не нужно нажимать на него, чтобы оставаться в курсе событий. Когда iPhone повернут лицевой стороной вниз или лежит в кармане, он гаснет, чтобы сэкономить время автономной работы. iOS 16 позволяет по-новому настраивать экран блокировки. Наложите слой на фотографию, чтобы сделать ее всплывающей. Отслеживайте свои звонки активности. И смотрите текущие обновления из ваших любимых приложений."]]
    }
}