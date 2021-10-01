Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3029E41F199
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Oct 2021 17:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhJAP5d (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 1 Oct 2021 11:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhJAP5a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Oct 2021 11:57:30 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3769EC061775
        for <linux-hwmon@vger.kernel.org>; Fri,  1 Oct 2021 08:55:46 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id s64so18467711yba.11
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Oct 2021 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=zjz8c51v6QbmhqWvymhrdUgej/MB9vz7qrm8TugWS68=;
        b=mx8VjkBDQNkwWdWmUuiGMIsBpuDqUD5Ot8Jtl5MBdmUYNvjBNpRiyShiZnkLcbWe+w
         H/8F0ZwVvkQG2qT4IGokCNyVl3Wkw7u9u9UTRYqNbTL1aBRdnbznZ6jO6GHLo80fq98Y
         OQ2/Vwc+/CDqnXRO7XE/W4p1ih0RyshJwgVHZMnqBF03lBnugtVe/fiTZ8Wj3Oqid9gw
         7GFPDnqpUCdp2qJufSf8Atbr6yqUvT6VZtjYkgwASoPEIMOmZbh2R6ayiLUVkR+C5ngu
         YvofYUMLKy7KDNg18hrZFRgHq3f79xUsv1ZMX/HyA1dOXjnOHvaEkR859D3QRU/DQwLE
         xHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=zjz8c51v6QbmhqWvymhrdUgej/MB9vz7qrm8TugWS68=;
        b=CiQHmGlxB8ZKYfWkLKRxnjGzFjEvuLX+BzU6V75zAHqzgb/RsLxouIqOOaZldNm40h
         POl5c11TfXfS8rzsVUWzlwHb65wSN402LKonZkOrQj5mVXMLEJGsj5EWK/96qMsUI4Ap
         2EJNUWTlAo3XGMBk8wrhvJhwBdMsMAr8s8NgvKPCs45eardMdPbcwyj2TwDfSbyh3BIb
         7rbGlPcEfDo+BIgnJINHPTQkRvjf4DzzcqQNRQsLphokPfjRjHlbKQVhE5qFB2o/PA8k
         E1xgyBG7ne0gQTcXIKbtLnaxrSYHA8mc/XYADe4vZeXChsl5nXk+bYMlDWPhcLoJbYvS
         OZYQ==
X-Gm-Message-State: AOAM531iKT2KXdj/J2KOFdUH/mUpt3W1jMT8v0oo3Y4WCjn7VvYiZ0fw
        AGZM60F8lJnjxqhOqbzAzMK02dz7p4cNH0lcLY0=
X-Google-Smtp-Source: ABdhPJxkKx4liU9e7CrmRYNw+HI7uwcZUFwXMjNLj3I5XBQwZ6SYGU6UlO3ZeCJq4n9nQSevtU5jJA500Cm2rxUN9EU=
X-Received: by 2002:a25:d4c5:: with SMTP id m188mr7053438ybf.105.1633103745436;
 Fri, 01 Oct 2021 08:55:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:bc1d:0:0:0:0 with HTTP; Fri, 1 Oct 2021 08:55:45
 -0700 (PDT)
Reply-To: fionahill.usa@hotmail.com
From:   Fiona Hill <gracedesmond2020@gmail.com>
Date:   Fri, 1 Oct 2021 08:55:45 -0700
Message-ID: <CAL7hghs6V1NE+XuN7bThEQeA=qm4YCvHsL0RA_ozDzUXEAsO4Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
You receive my message i send to you?
