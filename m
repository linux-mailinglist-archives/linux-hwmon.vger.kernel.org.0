Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A1423FCD8
	for <lists+linux-hwmon@lfdr.de>; Sun,  9 Aug 2020 07:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgHIFPK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 9 Aug 2020 01:15:10 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:33108 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgHIFPK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Aug 2020 01:15:10 -0400
Received: by mail-il1-f197.google.com with SMTP id m9so5213629ili.0
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2020 22:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+7GquL5yQSGcFGMZlACJ2Y2BFlEpHb0ViyNa4GHMUYI=;
        b=E/JdsXmlX9hGodxmOmG1PwghjQRTYfhu3wp1sQphXz2uIgLumVH/MH96mgdAl/+lVp
         292S4205MaacFLYnXK6wQdiAxjvIaflu/vtN0RamZW7oPysjGzZClTnOK7e+Iq0bt1Wx
         TYmgwSm08N7FGQot0tugno3qqivKz+2UIgMIjwmiec19zmU47ZXHieIazRhBdBl6UYck
         hf7Cfs+odgr0z6kyACxQZTtRTi7wAVN5kb1c6YudEy0CZrvpqWDHlyDU+FgTAX4Mf+GG
         +O5vMTi1i0ZG0B5GOupo8zKYuJm13SEd1q8rjiP8jdPPVewVoQgviiNPd3Ny63W4PhoX
         LUMA==
X-Gm-Message-State: AOAM530yIMoaTtLRyqBYZRINbav9w/IwKetJtQcyZZxjJ92hNTMWIRRw
        YPUBuDijLOrESTlR0mSwhoXpftCCEO6W7UBDoxG0GERrZIFj
X-Google-Smtp-Source: ABdhPJwnoROO8orXk27MbZoY6LmPmQEmrUZnYlYAjH2J4bAGvlMJDDzVwIZ0hH60TV5qaTtB7u2wVG/qNSiGwWh/MNVTaKiDIsBk
MIME-Version: 1.0
X-Received: by 2002:a92:918b:: with SMTP id e11mr12138160ill.201.1596950109419;
 Sat, 08 Aug 2020 22:15:09 -0700 (PDT)
Date:   Sat, 08 Aug 2020 22:15:09 -0700
In-Reply-To: <000000000000cde53e05ac446157@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fefd5e05ac6aeb99@google.com>
Subject: Re: WARNING: ODEBUG bug in put_device
From:   syzbot <syzbot+a9290936c6e87b3dc3c2@syzkaller.appspotmail.com>
To:     bgolaszewski@baylibre.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, jdelvare@suse.com,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@roeck-us.net, marcel@holtmann.org, netdev@vger.kernel.org,
        rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

syzbot has bisected this issue to:

commit 6f8c8f3c31015808100ee54fc471ff5dffdf1734
Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu Aug 8 08:01:44 2019 +0000

    hwmon: pmbus: ucd9000: remove unneeded include

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1550298a900000
start commit:   47ec5303 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1750298a900000
console output: https://syzkaller.appspot.com/x/log.txt?x=1350298a900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7bb894f55faf8242
dashboard link: https://syzkaller.appspot.com/bug?extid=a9290936c6e87b3dc3c2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b69a52900000

Reported-by: syzbot+a9290936c6e87b3dc3c2@syzkaller.appspotmail.com
Fixes: 6f8c8f3c3101 ("hwmon: pmbus: ucd9000: remove unneeded include")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
