Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A13264935
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731465AbgIJP6t (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Sep 2020 11:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731331AbgIJP5d (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 11:57:33 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D94AC061795
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 08:57:33 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id r10so1558497oor.5
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s0P2Hu0UBdytHoi9cBFjJqx8/fqS09nH7AkjOeqNqZ4=;
        b=MnfvehaDuTPkTf4OhPgvubDqRcJs7uzq7yvwjhtxlb1p556l44chZnbEmeoT6+UMI8
         PAzLI9T7cLNaWd3KscTfYxx5Fhledcjo3sSsjyOr5E+kkYmhmtqbU5yKHvlgVpkbDmo7
         psRTWyxRxju/IFfO21WnQL6iglrGpm0QfcGH998SNjtSdC7pAKsypTfzLuRv9j/Xx9mb
         OcDpjuI+DtfH7x+ApCbu4sXXQ0DYpSafxk9zGqoQGNokSNrVq9wEdqCZfSr4ETE8Gdok
         /m2MjmnwKJ9u7ZskMGgUJC26Cyun4c8KCH8BBbqkfOHBs7p9UKTAZG6cay6MYTavfo1A
         pa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s0P2Hu0UBdytHoi9cBFjJqx8/fqS09nH7AkjOeqNqZ4=;
        b=GwS7c6pnqBjF774C1U5cauibHY+W2l6M1ma9m0bL11iCzmzN/g489fDqop2qqcImvu
         ZAc1Zfk0oLto6TfosgCkn8YJvLR0fPYTLklNEk1Hr1/k0yack0XzkKlCXEJBTd6BOL2J
         KvZupuRhJofoAbzynSWQ9t1nIZE9TP11e0LByptJvqOV1nYpFUCCFSlSQkSYR1WdO9sn
         jsI4WykNITJwy0LG0vkNyTiXVXDAx6KctWlqijXNS2oC4Y4NgchxDzGEnv5soAHTuzF/
         Hda8teu/hAgzxvGR51JPzxU4pXOVz28BaEwi1W9EaajwOcZRreEdMoERPtpCfrgshEp+
         GxNg==
X-Gm-Message-State: AOAM533LcV+qd6Ii2HUdv/O6XfjtVdScrn5JKHceW871SNT0DeC4OJ4F
        5SOUbYjZFMK2y5pNfJEdwHAf78ZkH0Eh3ibqPCRLQsn0rCGyRa30
X-Google-Smtp-Source: ABdhPJwhHpo+iZsXmQP5XJpFpqqkvL2ITHtw6CNtFtnH5ov/jS72qLAie401HV25WmeeiSA/N9v7KWD1WKBPOdYQPNA=
X-Received: by 2002:a4a:ab48:: with SMTP id j8mr4912940oon.57.1599753450805;
 Thu, 10 Sep 2020 08:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200910103036.143702-1-linux@roeck-us.net>
In-Reply-To: <20200910103036.143702-1-linux@roeck-us.net>
From:   Alex Qiu <xqiu@google.com>
Date:   Thu, 10 Sep 2020 08:57:19 -0700
Message-ID: <CAA_a9x+wC-MqdLnoeQJqpcrO6mJgk5eR-ux88+1P_kVOW10iKg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Move boolean error condition check to
 generating code
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 10, 2020 at 3:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> 0-day rightfully complains about a sometimes uninitialized variable
> in pmbus_get_boolean().
>
> drivers/hwmon/pmbus/pmbus_core.c:903:13: warning:
>                 variable 'ret' is used uninitialized whenever 'if' condition is true
>         } else if (!s1 || !s2) {
>
> While that is technically true, it won't be hit in the field since the
> condition indicates a programming error. Move the check of that condition
> into the code generating the attribute entry, and refuse generating the
> attribute if the condition is true. Swap the condition check in
> pmbus_get_boolean() to ensure that static analyzers don't get a hiccup
> (because we check if s1 and s2 are NULL, static analyzers may believe
> that they can be NULL independently of each other).
>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Alex Qiu <xqiu@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alex Qiu <xqiu@google.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 5113b5eca17a..6be08696189c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -898,11 +898,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
>                 pmbus_update_sensor_data(client, s2);
>
>         regval = status & mask;
> -       if (!s1 && !s2) {
> -               ret = !!regval;
> -       } else if (!s1 || !s2) {
> -               WARN(1, "Bad boolean descriptor %p: s1=%p, s2=%p\n", b, s1, s2);
> -       } else {
> +       if (s1 && s2) {
>                 s64 v1, v2;
>
>                 if (s1->data < 0) {
> @@ -917,6 +913,8 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
>                 v1 = pmbus_reg2data(data, s1);
>                 v2 = pmbus_reg2data(data, s2);
>                 ret = !!(regval && v1 >= v2);
> +       } else {
> +               ret = !!regval;
>         }
>  unlock:
>         mutex_unlock(&data->update_lock);
> @@ -1044,6 +1042,9 @@ static int pmbus_add_boolean(struct pmbus_data *data,
>         struct pmbus_boolean *boolean;
>         struct sensor_device_attribute *a;
>
> +       if (WARN((s1 && !s2) || (!s1 && s2), "Bad s1/s2 parameters\n"))
> +               return -EINVAL;
> +
>         boolean = devm_kzalloc(data->dev, sizeof(*boolean), GFP_KERNEL);
>         if (!boolean)
>                 return -ENOMEM;
> --
> 2.17.1
>

Thanks!

- Alex Qiu
