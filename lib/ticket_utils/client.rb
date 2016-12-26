module TicketUtils

  class Client
    def checking(event_id)
      StubhubEvent.find(event_id)
    end
    # seats: opts[:seats],

    def show_listing(ticket_group_id)
      
    end

    def create_listing(opts = {})
      opts = {event_name: "Test Ticket1", event_date: "2016-10-20T20:00", 
      venue: "Test Venue", section: "5", row: "10", quantity: 4, low_seat: 101, 
      seats: "", ticket_type: 1, seating: 3, stock: 1, total_purchase_price: 1000,
      face_price: 1000,  purchase_price: 1000, sell_price: 1000, in_hand_status: 0, in_hand_days: 0,
      in_hand_date: "", notes: "", internal_notes: "", broker_notes: "", split_option: 0, splits: 0,
      delivery_option: 4,  near_term_delivery_option: 0, reference_number: "98784", vendor_code: 9  }
      tickets = {
        Tickets: [
        {
          Event: opts[:event_name],
          EventDate: opts[:event_date],
          Venue: opts[:venue],
          Section: opts[:section],
          Row: opts[:row],
          Quantity: opts[:quantity],
          LowSeat: opts[:low_seat],
          Seats: opts[:seats],
          TicketType: opts[:ticket_type],
          Seating: opts[:seating],
          Stock: opts[:stock],

          TotalPurchasePrice: {
            Amount: opts[:total_purchase_price],
            Currency: 'USD'
            },
          FacePrice: {
            Amount: opts[:face_price],
            Currency: 'USD'
          }, 
          PurchasePrice: {
            Amount: opts[:purchase_price], 
            Currency: 'USD'
          }, 
          SellPrice: {
            Amount: opts[:sell_price], 
            Currency: 'USD'
          },
          InHand: {
            InHandStatus: opts[:in_hand_status],
            InHandDays: opts[:in_hand_days], 
            InHandDate: opts[:in_hand_date]
          }, 
          Notes: opts[:notes], 
          InternalNotes: opts[:internal_notes], 
          BrokerNotes: opts[:broker_notes], 
          
          SplitOption: opts[:split_option], 
          Splits: opts[:splits],

          #No Need
          # if opts[:SplitOption] == -1
          #   listing_params[:splitOption] = 'NOSINGLES'
          # elsif opts[:split_option] == 0
          #   listing_params[:splitOption] = 'NONE'
          # else
          #   listing_params[:splitOption] = 'MULTIPLES'
          #   listing_params[:splitQuantity] = opts[:split_option]
          # end
          #ticketTraits: [],
          # status: 'INACTIVE' # Disable for production

          DeliveryOption: opts[:delivery_option],
          NearTermDeliveryOption: opts[:near_term_delivery_option],
          ReferenceNumber: opts[:reference_number],
        }
      ],
          
          # Barcodes: [
          #   {}, {}
          # ]
        VendorCode: opts[:vendor_code], 
        POType: 1, 
        Payments: [{
         PaymentModeId: "",
         Amount: {
           Amount: 0,
           Currency: "USD"
         },
         PaymentDate: "/Date(-62135578800000)/",
         PaymentMode: 5,
         PayPalEmail: "",
         PayPalTransactionId: "",
         Card: {
           CardType: 6,
           CardNumber: "",
           CardExpiryMonth: 9,
           CardExpiryYear: 2016,
           NameOnCard: ""
         },
         BankName: "",
         AccountNumber: 0,
         Description: "",
         Note: "",
         ReferenceNo: ""
        }]
      }

      headers = {"x-signature" => "#{}", "x-token" => "#{}", "content-type" => "application/json",
                  "x-api-version" =>  "2", }
      #tickets = tickets
  

      options = {
        body: tickets,
        headers: headers
      }
      path =  "https://api.ticketutils.net/POS/Inventory/AddTickets"
      puts "Ticket Utilites POST #{path} #{options}"
      response = HTTParty.post(path, body: tickets.to_json, headers: headers)
     # response = self.class.post(path, options)
      #response
    end    
  end

end
