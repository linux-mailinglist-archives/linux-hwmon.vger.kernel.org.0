Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722861E4744
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2020 17:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgE0PZH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 May 2020 11:25:07 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:26027 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730245AbgE0PZH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 11:25:07 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 9BACC201D0;
        Wed, 27 May 2020 18:25:04 +0300 (MSK)
Date:   Wed, 27 May 2020 18:25:04 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <10e43329-7822-83fb-ab58-c82c4a28373a@roeck-us.net>
Message-ID: <alpine.LNX.2.20.13.2005271823000.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com> <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru> <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com> <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru> <CAHfPSqA_0NhpEvn+jAGb3O7uc+EbZDKWajdR_A=RK9Y_-QgKnQ@mail.gmail.com> <10e43329-7822-83fb-ab58-c82c4a28373a@roeck-us.net>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Guenter Roeck wrote:

> > In the current driver, the accumulation thread starts during the probe and the
> > prev_value of sockets and the core0 is updated with the current MSR value.
> > It takes (nr_cpus - 1) iterations of the thread to populate the prev_value for
> > the other cores.
> > 
> > By populating prev_value of all the cores during probe, we can
> > certainly save some
> > information (values with in one wrap-around at the best). If this
> > information is
> > useful, i can submit a patch to do so. Guenter, could you suggest us on this.
> > 
> 
> As long as you don't ignore counter values from before loading the driver,
> sure, go ahead.

Hm? If I'm understanding correctly what Naveen is proposing, that would simply
move reading the initial values ahead by a few hundred cycles (the latency to
start the thread). It wouldn't change anything about the issue, and make the 
code more complicated :(

Alexander
