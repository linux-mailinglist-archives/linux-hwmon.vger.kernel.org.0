Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60243B3451
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Jun 2021 19:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhFXRLo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 24 Jun 2021 13:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFXRLl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Jun 2021 13:11:41 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36B8C061768
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Jun 2021 10:09:21 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id u2so7084625ilk.7
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Jun 2021 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=p95plxgcKdT8+TUJCmcKdAyJL6L8C+j3muAeTI6tbvEOMwKUFZvBH22Z3GEGxdnUZH
         d9XkDasjcz/bUj2n1PkWxPPQL/Sxtf1a7ckN43IkWwU4a9v6DYeOi9Tg8DPYHl700hH/
         xlmv54Ir2NUVB8zwaX1UsxTzP5GUW3mdywmszCeflzWKbXzDgkMNhx+qVsi3FklHnD5x
         fSDWvxz3POXOJ/0yZM+F2G99rPMTFJK+bPA5TWYu0VJpvpEjmQwRSgXLB6dx+kXpC0Uz
         JX+JhI0lSB7VkwJTdkbApCrUx6TGzp99N5mAm/d0lil4hmexz93RFAPSpMzmwkjNchKB
         rXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=ANhbTggsY3NFhRZExKMwUmb3VzJqye8XLvWVXSvNBkQ=;
        b=me+WXc6kjN8AijYA34WHa1ghJOLq7w5ukANUYA+S2jznS9z6eM+5FP03HgybbSO/R7
         e1qLz+5GWDKiGlIHpg914G0hE1WEs7WGx9w4pA/rVYOyR4gBqJQir3eViLN8n3pXYGcS
         u5yxDYmlOR5Es6uahLoyDWKhkxubdzrnpHl5ZvzKwRqDdhQcHj5xUh/Z8INnOIPE97oS
         E+2ZF/nbV/PJ+s/fHMt27WfSazaCEH8WQB1yfRNtTDfKxBLVQL6wfrkMzB8bpOxeauKT
         scJ0D4ZcXZPXzA0ZE0d+Xd2cKoQQ54TJm3Ww+0ODuBj6/m/JvJE761Cmz18yxkta0BIJ
         dJiw==
X-Gm-Message-State: AOAM532n+I+j7ghJjx5rTmBQANERHuBuhwg9ZaLG7D01HuCLVvBnTV21
        MA3j55BRG8JQUv3kHOXxR9y/PwoO5nR/igq2Y0s=
X-Google-Smtp-Source: ABdhPJzkYUuO368jts0QgMQyJe9SHzg0U698qd8KdfojEfYsXnHtwMfPGxVHmw7fwQ64+IhHRhAEJH5nusdeW4BWzcA=
X-Received: by 2002:a05:6e02:524:: with SMTP id h4mr4098121ils.255.1624554560853;
 Thu, 24 Jun 2021 10:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:3aa:0:0:0:0 with HTTP; Thu, 24 Jun 2021 10:09:20
 -0700 (PDT)
Reply-To: tutywoolgar021@gmail.com
In-Reply-To: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
References: <CADB47+4Wa3T59Vq_==GTXEfHrX5x-2vQFxaTBO0dTdyAweCVpw@mail.gmail.com>
From:   tuty woolgar <faridaamadoubas@gmail.com>
Date:   Thu, 24 Jun 2021 17:09:20 +0000
Message-ID: <CADB47+607zNBfYFb4bj0nUhuuYgAdwT=G_wJ9-EeV0ESHe56Jg@mail.gmail.com>
Subject: greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

My greetings to you my friend i hope you are fine and good please respond
back to me thanks,
