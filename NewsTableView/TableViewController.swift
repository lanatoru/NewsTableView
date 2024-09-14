//
//  TableViewController.swift
//  NewsTableView
//
//  Created by Yuliya Masalkina on 14.09.2024.
//

import UIKit

class TableViewController: UITableViewController {
    

    // массив новостей, которые будут добавляться в ленту
    var arrayNewsFeed : [News] =
    [News(header: "«Большая книга»", body: "17-й сезон «Большой книги» – главной российской литературной премии – подошел к концу. Экспертный совет выбрал для короткого списка финалистов 10 книг из 48 претендентов лонг-листа.", time : Date.now )]
    
    
    var arrayNews : [News] =
    [News(header: "Жаркие книги в холодный сезон", body: "За окном становится все холоднее, а душа и тело требуют тепла. Предлагаем согреться жаркой историей, происходящей в обстановке настоящего лета: в пустыне или у моря, под сухим палящим солнцем или в удушливой влаге далеких тропиков.", time : nil),
    News(header: "Ощущение зимы", body: "Ознаменуем приближение зимы самыми подходящими книгами, чтобы полностью погрузиться в атмосферу вьюг, холодов и вечеров с горячим чаем и интересным сюжетом.", time : nil),
    News(header: "«Электронная буква»: шорт-лист", body: "Очередной сезон первой в России премии в области электронных и аудиокниг – «Электронная буква» – в разгаре. Это прекрасная возможность открыть для себя новые имена и голоса. ", time : nil),
    News(header: "Топ сентября", body: "Собрали самое интересное за месяц.", time : nil),
    News(header: "«Оскароносные» книги", body: "За 93 года существования премии «Оскар» накопилось очень много хороших картин, которые можно смотреть подряд по списку. Чтобы сузить выбор для занятого читателя, мы отобрали романы, которые легли в основу фильмов – победителей в номинации «Лучший фильм года».", time : nil),
    News(header: "Что читает Роберт Дауни – младший", body: "Наибольшую известность американскому актеру, музыканту и продюсеру принесли роли Железного Человека в проектах Marvel и Шерлока Холмса в картинах Гая Ричи. Собрали книги, которые Роберт Дауни – младший рекомендовал в разных интервью. ", time : nil),
    News(header: "Притаившееся зло: книги о злодеях", body: "Книги про маньяков и серийных убийц – безопасный способ пощекотать себе нервы. Кровавые сцены, опасность и неожиданный финал – то, чего ждут бесстрашные поклонники триллеров. Тем интереснее, когда оказывается, что главный злодей все время был перед глазами.", time : nil),
    News(header: "Киберпанк: топ по оценкам читателей", body: "Киберпанк – жанр научной фантастики, который описывает будущее как техногенную антиутопию. В этих историях эра стремительного прогресса – искусственный интеллект, генная инженерия, компьютерные сети – неизбежно ведет к катастрофе и деградации человечества.", time : nil),
    News(header: "Если магия утра не работает", body: "Этот мир устроен практически целиком для жаворонков – и это несправедливо: по данным разных исследований, существует от 15 до 30% сов, людей, которые лучше функционируют во вторую половину дня. Как найти свое место в мире ранних пташек, высыпаться и хорошо себя чувствовать? Вот несколько советов. ", time : nil),
    News(header: "Букеровская премия", body: "Лауреатом стал писатель из Шри-Ланки Шехан Карунатилака. Жюри выделило его роман The Seven Moons of Maali Almeida. Это история о жизни после смерти. Маал Алмейд – военный фотограф, и у него есть семь лун, чтобы показать живому миру свои фотоработы.", time : nil),
    News(header: "Нобелевская премия по литературе", body: "Лауреатом стала французская писательница Анни Эрно «за мужество и остроту, с которыми она раскрывает корни, отчужденность и коллективные ограничения личной памяти». На ее счету десятки книг о связи поколений, коллективной памяти и личном опыте.", time : nil)]
    
    var timer = Timer()
    
    var counter = 0
    
    var arrayIndex = 0
    
    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        runTimer()
    }

    // MARK: - Table view data source

        
    @objc func updateTimer() {
        
        counter += 1
        
        // записываем новости из второго массива в первый
        if arrayIndex < arrayNewsFeed.count {
            var news = arrayNews[arrayIndex]
            news.time = Date.now
            
            arrayNewsFeed.insert(news, at:  0 )
            arrayIndex += 1
            tableView.reloadData()
        }

        
        if counter == arrayNews.count {
            timer.invalidate()
        }
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNewsFeed.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)

        // Configure the cell...
        
        let newsHeader = cell.viewWithTag(1000) as! UILabel
        newsHeader.text = arrayNewsFeed[indexPath.row].header
        
        let newsBody = cell.viewWithTag(1001) as! UILabel
        newsBody.text = arrayNewsFeed[indexPath.row].body
        
        
        let newsDate = cell.viewWithTag(1002) as! UILabel
        dateFormatter.dateFormat = "d MMMM HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru-RU")
        newsDate.text = dateFormatter.string(from: arrayNewsFeed[indexPath.row].time!)

        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
