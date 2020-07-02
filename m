Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619242129D9
	for <lists+linux-hwmon@lfdr.de>; Thu,  2 Jul 2020 18:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgGBQil (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 2 Jul 2020 12:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgGBQik (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Jul 2020 12:38:40 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF27CC08C5DD
        for <linux-hwmon@vger.kernel.org>; Thu,  2 Jul 2020 09:38:40 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id q15so8914787uap.4
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2020 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FEtyZGHGPJIZFNjI/Ip4xEzWQIwRU4IYgLEED0Ona/I=;
        b=jo67aa/lHzYqjfYskLWKW5quEITA5FiC6PWEwsrYI0aMCYXg4HY7LncYRG9WkKyXDj
         7BOU8BGXvkvEN2Q3XjgBl5MKhKWUMKGtaCA7meltTOvUmo0nm1QZurL7IYfJGwqnR8dm
         c41ogPba76PP5CTQrvGAHBqF70Qu9M4yFRZSG7CUKlo+tp0GsaGMt79ZKwyBgAr6NDiK
         rGrUPl8FW4kvGT+0gKpgTOHJ1422EOyUD/ab/axNgRiQMdrLLFYdTkHa6uKWZZsl87iE
         +3pVhBssylZ8qgB4tO80LGaZAdWXdcmPQqF2rc6o4BbLErNMrD9Apy3l5feTNLqbmDOP
         QBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEtyZGHGPJIZFNjI/Ip4xEzWQIwRU4IYgLEED0Ona/I=;
        b=hn06BjeB03cBW8i+SNZcRbDQu2QX5pnPPhfKOYyu3JqQ4hFSx8g3+/yLhXmCxw1l6S
         oQrEPTJ6CSGaI5WrE6fFtc3/PnDMiX8xb6Pt9dSbrFdfPvQ082NII+LmNzP0mjb9gclP
         p1kIAQzffQsuQfkbQfHqCfxzhI9p2ZwL6d2SgE9vZkwce0SQyEwaV5hjTqzHR6EOtlzN
         P5f36JyvcZQ41qzZ1i1dvwXraE5qWA9AkvQvNjeB0kG+iRnLysEC9ZbHsr8ETsOIZsXD
         Aa1ojvfm6l0ESYID/h9kADNR3CkCtG3B5vvX/HBAzup/w3m4HmRrxOK2OQaeJ2s3l8o1
         +Dhw==
X-Gm-Message-State: AOAM531lUBrRj204TYpkhFycXd8Wa5d2EtZieu6zNf+CKPcr2iSGd0b0
        CfMAvoflVOdb9CAF0CJBX/8IJQvc5TnOipphIvPqPQ==
X-Google-Smtp-Source: ABdhPJzy3R8feg5WOHFZEWnBC021WeM1muKk3BvjvajYrjfmItC3J16JyyfE80+c2pVrKZr1W0y8O2p4UVxT2Y/Hars=
X-Received: by 2002:ab0:6510:: with SMTP id w16mr14005307uam.97.1593707919367;
 Thu, 02 Jul 2020 09:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200630174350.2842555-1-linchuyuan@google.com>
 <20200702014223.4096977-1-linchuyuan@google.com> <20200702051453.GA235128@roeck-us.net>
In-Reply-To: <20200702051453.GA235128@roeck-us.net>
From:   Chu Lin <linchuyuan@google.com>
Date:   Thu, 2 Jul 2020 09:38:28 -0700
Message-ID: <CAKCA56D-jHF80J7u=YGcwE-+d6AjNfrbkin5AbavKAJPCqkygg@mail.gmail.com>
Subject: Re: [PATCH] hwmon:max6697: Allow max6581 to create tempX_offset attributes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Ling <jasonling@google.com>,
        Kais Belgaied <belgaied@google.com>,
        Zhongqi Li <zhongqil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 1, 2020 at 10:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Jul 02, 2020 at 01:42:23AM +0000, Chu Lin wrote:
> > Per max6581, reg 4d and reg 4e is used for temperature read offset.
> > This patch will let the user specify the temperature read offset for
> > max6581. This patch is tested on max6581 and only applies to max6581.
> >
> Patchwork received four versions of this patch, with two different
> subject lines.
>
> How am I supposed to know which one to look at ?

Sorry for the confusion.
I was learning how to send amendments to a patch and forget that
it may create confusion for the reviewers. The latest one with headline
hwmon:max6697: Allow max6581 to create tempX_offset attributes is the one that
should be reviewed.

Chu
