//
//  Video.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

struct Video {

    let URL: NSURL
    let name: String
    let thumbnail: UIImage
    let description: String

    init(name: String, url: NSURL, description: String, thumbnail: UIImage) {
        self.name = name
        self.URL = url
        self.description = description
        self.thumbnail = thumbnail
    }

    static func defaultVideo() -> Video {
        return Video(name: "Jaedong vs Lilbow - WCS EU S3 - Premier Group Stage Ro16 - Groupe D - 09/09/15",
            url: NSURL(string: "http://r19---sn-p5qlsnle.googlevideo.com/videoplayback?expire=1442389910&mv=m&mt=1442368189&ms=au&id=o-AEovyVYylM3Bljt0UAO-e3BxJt9QBeICuPXE-Laro301&pl=20&mn=sn-p5qlsnle&mm=31&source=youtube&mime=video/mp4&ip=69.126.53.71&fexp=9407663,9408087,9408213,9408710,9409069,9415365,9415485,9416023,9416126,9416330,9416495,9417250,9417707,9417912,9418153,9418339,9418448,9419046,9420312,9420348,9420798&itag=22&ratebypass=yes&ipbits=0&key=yt5&upn=UlOp6_JfNmQ&sver=3&nh=IgpwcjAyLmlhZDI2KgkxMjcuMC4wLjE&signature=E9FFA4C69212256DD82110FD0740C447DF88ED.B29986146215CD0D5108739D4F38A5CA33821A35&usequic=no&dur=3483.550&initcwndbps=665000&lmt=1442133962222953&sparams=dur,id,initcwndbps,ip,ipbits,itag,lmt,mime,mm,mn,ms,mv,nh,pl,ratebypass,source,upn,usequic,expire&signature=22")!,
            description: "Jaedong vs Lilbow!",
            thumbnail: UIImage(named: "thumbnail")!)
    }

    static func dummyVideos() -> Array<Video> {
        var videos = Array<Video>()
        for _ in 1...50 {
            videos.append(Video.defaultVideo())
        }
        return videos
    }

    func videoFormattedDescription() -> String {
        return self.name + "\n" + self.description
    }

}
