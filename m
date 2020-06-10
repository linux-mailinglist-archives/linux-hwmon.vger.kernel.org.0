Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE831F5D05
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2020 22:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgFJUVo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 10 Jun 2020 16:21:44 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:18733 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgFJUVn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jun 2020 16:21:43 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id DBC09203C1;
        Wed, 10 Jun 2020 23:21:40 +0300 (MSK)
Date:   Wed, 10 Jun 2020 23:21:40 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
Message-ID: <alpine.LNX.2.20.13.2006102320180.15859@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
 <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 28 May 2020, Naveen Krishna Ch wrote:

> > No, this isn't right. The workload is not stressing all cores, you're
> > reporting 235 J for core 0 and only 35 J for core 7.
> >
> > If you are running the avx-turbo test, please run it like this:
> >
> >   ./avx-turbo --iters 10000000 --spec avx256_fma_t/8
> >
> > This will run AVX code on all 8 cores for about 1 second. To run it for longer,
> > increase the --iters argument.
> I ran with all cores loaded now and i see that
> sum of diff of energy consumed by all cores is greater than the diff of
> socket energy consumed in 100secs.
> 
> Kindly, give me time. I will come back with some explanation or solution.

Hello. Is there any update on this issue?

Thanks.
Alexander
