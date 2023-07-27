Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916E6765CD0
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Jul 2023 22:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjG0UD1 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 27 Jul 2023 16:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjG0UD0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 16:03:26 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C4B30DA;
        Thu, 27 Jul 2023 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=uoBz22zvA+qLFiterr5fZWk0KWLV8flawrD3Na3jQmk=; b=RKm4hBMGG6P0W1llheMcaUYQ+p
        g9/U8eZXu7+k7VkJ61RHJC1denMqivdMbc6GUYAbHKLWy6T9Zrf4+v4h7vaHvKlGZ14lg67Eamwqp
        AFNnQHoUxO+/vHidtWEhBZ5GGAqdnVYf4uvukAc2ZuWd8xdxSGQyWRrNz1CBKRjxiYCM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qP7Bs-002U7H-8b; Thu, 27 Jul 2023 22:02:28 +0200
Date:   Thu, 27 Jul 2023 22:02:28 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Saeed Mahameed <saeed@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
        Tariq Toukan <tariqt@nvidia.com>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Adham Faris <afaris@nvidia.com>, Gal Pressman <gal@nvidia.com>
Subject: Re: [PATCH net-next 1/2] net/mlx5: Expose
 port.c/mlx5_query_module_num() function
Message-ID: <432a3e69-42e2-42fd-91f1-9889a881e23d@lunn.ch>
References: <20230727185922.72131-1-saeed@kernel.org>
 <20230727185922.72131-2-saeed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727185922.72131-2-saeed@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 27, 2023 at 11:59:21AM -0700, Saeed Mahameed wrote:
> From: Adham Faris <afaris@nvidia.com>
> 
> Make mlx5_query_module_num() defined in port.c, a non-static, so it can
> be used by other files.
> 
> Issue: 3451280

Which public bug tracker is this from?

      Andrew
