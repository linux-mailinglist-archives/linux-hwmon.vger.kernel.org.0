Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB211E39BB
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2020 08:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgE0G7k (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 May 2020 02:59:40 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:14407 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728303AbgE0G7k (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 02:59:40 -0400
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
        by smtp.ispras.ru (Postfix) with ESMTP id 431B0201D0;
        Wed, 27 May 2020 09:59:37 +0300 (MSK)
Date:   Wed, 27 May 2020 09:59:37 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
cc:     Guenter Roeck <linux@roeck-us.net>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
In-Reply-To: <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
References: <20200519155011.56184-1-nchatrad@amd.com> <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net> <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com> <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 27 May 2020, Naveen Krishna Ch wrote:

> These registers are 32bit counters, they might wrap-around quite faster at
> high work loads. So, we used a kernel thread to accumulate the values of
> each core and socket to 64bit values.
> 
> Depending on when the module is inserted in the system, the initial values
> of the counters could be different and we do not have a way to know, how
> many time the registers are wrapped around in the past.

I understand that. If you anticipate that the module may be inserted after a
wraparound, the driver should populate 'prev_value' with actual counter
values instead of zeros. That way the driver will properly accumulate
energy over time it's been inserted. As implemented, the driver counts
energy since boot time, minus unknown amount lost to wraparounds if the
driver was loaded too late.

In my case I observed the contradictory readings over a period of several
seconds where no wraparound was possible.

> In our evaluation, the sum of the energy consumption of cores of a socket was
> always less (actually far lesser) than the socket energy consumption.

Did you try on laptop CPUs (Renoir SoC, Ryzen 4x00U marketing name)? You also
might need specific workloads to observe the issue, I first found it with a
small hand-written test, and then found a bigger discrepancy with AVX test
from https://github.com/travisdowns/avx-turbo

Alexander
