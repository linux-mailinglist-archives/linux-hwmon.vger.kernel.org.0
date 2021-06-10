Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF183A338D
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Jun 2021 20:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhFJSyf (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Jun 2021 14:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJSyf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Jun 2021 14:54:35 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57F4C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Jun 2021 11:52:38 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id j14so2339ila.6
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Jun 2021 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metormote-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ke10RFGtmINUHMFWqxQaW8kPT87imtbx83IlvIPduk=;
        b=HIylUGaAP8Oe1xENXtH0XdeF540HLBIIFlk115LE8i7ngnhrJlIDy90ZEZ572n86MQ
         TiPvRD0Fi7ukmyxp7c+tldIk8PuMjhawW27hIQXf0/4mJu9AT8wfhA1sF02M86zYd7eZ
         3GmCxWm5/06I732QCEkQyovxsNhI3fJ3LrurswsLph98J8jFU16h+FRS/fr6+dVA+ouK
         Be42IgFDrSPe9TxZYQRdYJsytlaSUqYbUSOTWKI8fs8J1PiIV/hSF1HaaQqc5gBn7A4R
         2r2NhDeIPwTq8VFQl8+ZFHKizXcboG6MKDwYJ8/gshl0WeV8yg83n+xcYULcSvv2Wmhk
         R0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ke10RFGtmINUHMFWqxQaW8kPT87imtbx83IlvIPduk=;
        b=fofJKzzSN1XURxvM+cHCf1OgD+Jp8GZOGtgNYcTnWnzUM63rZhQZ48XOkou9MjY1nZ
         2iXm4eRJtFVoIfC9G4FrzyOpsOacWnTXtk/HCKb/ZmbjD1PVIm5TvSXazjFCmoirapii
         96FjPvPUjn7+H2Fc3/Yucxp0HQbdOT9ncV40bnX8WP18bzOn3nVlgQ8E9AVGD2sC0ixW
         ZmfKW8RJfog+u+m6qJNQGyQLl9hic0doS2ImJ3hEyprHkXiFwluhslvVc5aOiJoWzQIU
         SCU560hNXqI1FzgXQX8DoEjMzYYDgnzZPrt8ltpBRdjAM1lYkiXjWFf9couLQdSf/WnG
         L+1Q==
X-Gm-Message-State: AOAM532FvANO0fNPp402XN4YYeyD3G56hWZ8jyAwDdkmZ3fAZ+KbgMGu
        8fRHhaEqd/K7VjwhaM776lnsqCY1fmb0sClzVRYrTA==
X-Google-Smtp-Source: ABdhPJzbpFvXOi6rwxkqPwNGL/dY1abqxxdYe5aNKv+wLbBs/kuUSHnR7pGYrZxTcA5P/WL8aqm34FSjWv8/c9Upyhs=
X-Received: by 2002:a05:6e02:5a3:: with SMTP id k3mr198832ils.302.1623351157870;
 Thu, 10 Jun 2021 11:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <68276e1d-f262-d379-4600-88abdbecddd8@canonical.com> <20210610171443.GB3861769@roeck-us.net>
In-Reply-To: <20210610171443.GB3861769@roeck-us.net>
From:   Erik Rosen <erik.rosen@metormote.com>
Date:   Thu, 10 Jun 2021 20:52:27 +0200
Message-ID: <CA+ui0H=xWj_H-U8jCohgs_ikdB9eQdjA605oviiEy35NUE18vw@mail.gmail.com>
Subject: Re: hwmon: (pmbus) Add support for reading direct mode coefficients
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ok, thanks.

/Erik

On Thu, Jun 10, 2021 at 7:15 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Eric,
>
> On Thu, Jun 10, 2021 at 05:55:40PM +0100, Colin Ian King wrote:
> > Hi,
> >
> > Static analysis with Coverity on linux-next has detected a potential
> > issue in drivers/hwmon/pmbus/pmbus_core.c with the following commit:
> >
> No need to send a patch - I fixed it up by pre-initializing ret.
>
> Thanks,
> Guenter
>
> > commit 999d577d7c007d38ab83eee4532d107c2233f78f
> > Author: Erik Rosen <erik.rosen@metormote.com>
> > Date:   Wed Jun 9 11:32:06 2021 +0200
> >
> >     hwmon: (pmbus) Add support for reading direct mode coefficients
> >
> > The analysis is as follows:
> >
> > 2219 static int pmbus_init_coefficients(struct i2c_client *client,
> > 2220                                   struct pmbus_driver_info *info)
> > 2221 {
> >
> >     1. var_decl: Declaring variable ret without initializer.
> >
> > 2222        int i, n, ret;
> > 2223        const struct pmbus_class_attr_map *map;
> > 2224        const struct pmbus_sensor_attr *attr;
> > 2225
> >
> >     2. Condition i < 6UL /* sizeof (class_attr_map) / sizeof
> > (class_attr_map[0]) + (int)sizeof (struct
> > pmbus_init_coefficients::[unnamed type]) */, taking true branch.
> >
> >     5. Condition i < 6UL /* sizeof (class_attr_map) / sizeof
> > (class_attr_map[0]) + (int)sizeof (struct
> > pmbus_init_coefficients::[unnamed type]) */, taking true branch.
> >
> >     8. Condition i < 6UL /* sizeof (class_attr_map) / sizeof
> > (class_attr_map[0]) + (int)sizeof (struct
> > pmbus_init_coefficients::[unnamed type]) */, taking true branch.
> >
> > 2226        for (i = 0; i < ARRAY_SIZE(class_attr_map); i++) {
> > 2227                map = &class_attr_map[i];
> >
> >     3. Condition info->format[map->class] != direct, taking true branch.
> >     6. Condition info->format[map->class] != direct, taking true branch.
> >     9. Condition info->format[map->class] != direct, taking false branch.
> >
> > 2228                if (info->format[map->class] != direct)
> >
> >     4. Continuing loop.
> >     7. Continuing loop.
> >
> > 2229                        continue;
> >
> >     10. Condition n < map->nattr, taking true branch.
> >     13. Condition n < map->nattr, taking true branch.
> >     16. Condition n < map->nattr, taking false branch.
> >
> > 2230                for (n = 0; n < map->nattr; n++) {
> > 2231                        attr = &map->attr[n];
> >
> >     11. Condition map->class != attr->class, taking true branch.
> >     14. Condition map->class != attr->class, taking true branch.
> > 2232                        if (map->class != attr->class)
> >     12. Continuing loop.
> >     15. Continuing loop.
> >
> > 2233                                continue;
> > 2234                        ret = pmbus_read_coefficients(client, info,
> > attr);
> > 2235                        if (ret >= 0)
> > 2236                                break;
> > 2237                }
> >
> > Uninitialized scalar variable (UNINIT)
> >     17. uninit_use: Using uninitialized value ret.
> >
> > 2238                if (ret < 0) {
> > 2239                        dev_err(&client->dev,
> > 2240                                "No coefficients found for sensor
> > class %d\n",
> > 2241                                map->class);
> > 2242                        return -EINVAL;
> > 2243                }
> > 2244        }
> > 2245
> > 2246        return 0;
> > 2247 }
> >
> > With the continue statements on line 2233 (or if map->nattr is zero) it
> > may be possible that ret is never assigned a value and so the check on
> > line 2238 could be checking an uninitialized variable ret. I'm not sure
> > if this is a false positive, but it may be worth initializing ret to
> > some sane value to catch these corner cases.
> >
> > Colin
> >
